require 'optparse'
require 'dircat'

module DirCat

  class DirCatQuery

    def self.run
      return self.new.parse_args( ARGV)
    end

    def parse_args( args )
      options = {}
      opts = OptionParser.new
      opts.banner =
        "Usage: dircat_query [options] <filedircat> <command>\n" +
        "mostra informazioni su un dircat\n"

      opts.on("-h", "--help", "Print this message") do
        puts opts
        return 0
      end

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options[:verbose] = v
      end

      rest = opts.parse( args )

      # p options
      # p ARGV

      if rest.length < 2
        puts "inserire il nome del catalogo da interrogare e il comando da eseguire"
        puts "-h to print help"
        return 0
      end

      cat_filename = rest[0]
      command = rest[1]

      #
      # option verbose
      #
      if options.has_key?(:verbose)
        if options[:verbose]
          $VERBOSE_LEVEL = 1
        end
      end

      s = Cat.loadfromfile( cat_filename )

      #case command
      #else
      puts s.send( command.to_sym )
      #end
      return 0
    end
  end
end
