require 'ftools'
require 'tmpdir'
require 'md5'
require 'yaml'
require 'ostruct'

#
# GLOBAL VAR
#

$VERBOSE_LEVEL = 0

#
# calcola md5 di file grandi, copiata da usenet
#
class MD5
  def self.file(file)
    File.open(file, "rb") do |f|
      res = self.new
      while (data = f.read(4096))
        res << data
      end
      res
    end
  end
end

#
# copiata da http://wiki.rubygarden.org/Ruby/page/show/FixNumFormat
#
class Numeric
	def with_separator( separator = ',', length = 3 )
	  splitter = Regexp.compile "(\\d{#{length}})"
	  before, after = self.to_s.split('.')
	  before = before.reverse.gsub splitter, '\1' + separator
	  str = "#{ before.chomp( separator ).reverse }"
	  str += ".#{ after }" if after
	  return str
	end
end

class EntrySer < OpenStruct
end

#
# Entry
#
class Entry

  attr_reader :md5
  attr_reader :name
  attr_reader :path
  attr_reader :size
  attr_reader :mtime

  def from_filename( filename )
    # puts "Entry::initialize #f"
    if $VERBOSE_LEVEL > 0
      cr = "\r"
      clear = "\e[K"
      print "#{cr}#{filename}#{clear}"
    end
    @name = File.basename(filename)
    @path = File.dirname(filename)
    stat = File.stat(filename)
    @size = stat.size
    @mtime = stat.mtime
    # self.md5 = Digest::MD5.hexdigest(File.read( f ))
    @md5 = MD5.file( filename ).hexdigest
    self
  end

  def from_ser( entry_ser )
		@md5   = entry_ser.md5
		@name  = entry_ser.name
		@path  = entry_ser.path
		@size  = entry_ser.size
		@mtime = entry_ser.mtime
		self
  end

  def to_ser
    entry_ser = EntrySer.new
		entry_ser.md5   = @md5
		entry_ser.name  = @name
		entry_ser.path  = @path
		entry_ser.size  = @size
		entry_ser.mtime = @mtime
		entry_ser
  end

  def to_s
    @md5 + "  " + @name + "\t " + @path + "\n"
  end

end

class DirCatSer < OpenStruct
end

#
# DirCat
#
class DirCat

  attr_reader :dirname
  # data di creazione
  attr_reader :ctime
  attr_writer :ctime
  # attr_reader :entries

  def from_dirname( dirname )
    # puts "#{self.class.name}#initialize"
    @dirname = dirname
    @ctime = DateTime.now
    @entries = Array.new
    @md5ToEntries = Hash.new
    self
  end

  def from_ser(dircat_ser)
    @dirname = dircat_ser.dirname
    @ctime   = dircat_ser.ctime
    @entries = Array.new
    @md5ToEntries = Hash.new
    dircat_ser.entries.each{ |entry_ser|
      add_entry( Entry.new.from_ser( entry_ser ) )
    }
    self
  end

  def to_ser
    dircat_ser = DirCatSer.new
    dircat_ser.version = 0.1
    dircat_ser.dirname = @dirname
    dircat_ser.ctime   = @ctime
    dircat_ser.entries = []
    @entries.each { |entry|
      dircat_ser.entries << entry.to_ser
    }
    dircat_ser
  end

  def self.loadfromdir( dirname )
    # puts "#{self.class.name}#loadfromdir( #{dirname} )"
    if not File.directory?( dirname )
      puts "'#{dirname}' non e' una directory o non esiste"
      exit
    end

    s = self.new
    s.from_dirname( File.expand_path( dirname ) )
    s._loadfromdir
  end

  def _loadfromdir()
    old_dirname = Dir.pwd
    Dir.chdir( @dirname )
    Dir["**/*"].each { |f|
      # puts "#{self.class.name}#loadfromdir #{f}"
      next if File.directory?( f )
      add_entry( Entry.new.from_filename( f ) )
    }
    if $VERBOSE_LEVEL > 0
      print "\n"
    end
    Dir.chdir( old_dirname )
    self
  end

  def self.loadfromfile( filename )
    if not File.exist?( filename )
      puts "'#{filename}' non esiste"
      return
    end
    dircat_ser = YAML::load( File.open( filename ) )
    DirCat.new.from_ser( dircat_ser )
  end

  def savetofile( file )
    if file.kind_of?(String)
      File.open( file, "w" ) do |f|
        f.puts to_ser.to_yaml
      end
    else
      file.puts to_ser.to_yaml
    end
  end

  def size
    @entries.size
  end

  def bytes
    @entries.inject(0) {|sum, entry| sum + entry.size }
  end

  def report
    dups = duplicates
    s = "Directory base: #@dirname\n" +
        "Nr. file #{size}\n" +
        "Bytes #{bytes.with_separator}"
    if duplicates.size > 0
      s+= "\n duplicates #{dups.size}"
    end
    s
  end

  def add_entry( e )
    @entries.push( e )
    if @md5ToEntries.has_key?( e.md5 )
      # puts "Entry duplicata!!!"
      @md5ToEntries[ e.md5 ].push( e )
    else
      @md5ToEntries[ e.md5 ] = [ e ]
    end
  end

  def contains( e )
    @md5ToEntries.has_key?( e.md5 )
  end

  def -(s)
     result = DirCat.new.from_dirname( @dirname )
     @entries.each { |e|
       result.add_entry(e) unless s.contains(e)
     }
     result
  end

  def duplicates
    list = []
    @md5ToEntries.each_value do |ee|
      next if ee.size < 2
      list.push( ee )
    end
    list
  end

  def fmt_simple
     @entries.each { |e|
       print e.to_s
     }
  end

  def fmt_ruby( dst )
     puts "require 'fileutils'"
     @entries.each { |entry|
     	 src = File.join( @dirname, entry.path, entry.name );
       puts "FileUtils.cp( \"#{src}\", \"#{dst}\" )"
     }
  end

  def list_dup
    r = ""
    duplicates.flatten.each { |e|
        r += e.to_s + "\n"
    }
    r
  end

  def script_dup
    r = "require 'fileutils'\n"
    duplicates.each { |entries|
      flg_first = true
      r += "\n"
      entries.each{ |entry|
        src = File.join( @dirname, entry.path, entry.name );
        if flg_first
          flg_first = false
          r += "# FileUtils.mv( \"#{src}\", \"#{Dir.tmpdir}\" )\n"
        else
          r += "FileUtils.mv( \"#{src}\", \"#{Dir.tmpdir}\" )\n"
        end
      }
    }
    r
  end

end