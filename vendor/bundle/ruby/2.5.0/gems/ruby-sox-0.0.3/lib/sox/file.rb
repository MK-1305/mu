module Sox
  # Represents input or output file with its options for the `sox` command.
  class File
    # Path to file or whatever.
    attr_reader :path

    # File options which will be placed right before it.
    attr_reader :options

    # True if path doesn't need to be escaped.
    attr_accessor :escaped


    # @param path [String] path to file
    # @param options [Hash{Symbol => Symbol,String,Numeric}] file options
    def initialize(path, options = {})
      @path    = path
      @options = options
      @escaped = false
    end

    # Does the path need to be escaped?
    #
    # @return [Boolean]
    def escaped?
      @escaped
    end
  end
end
