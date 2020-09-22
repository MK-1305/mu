module Sox
  # Common parent class for combiner strategies.
  class Combiner::BaseStrategy
    include Sox::Shell

    # @param input_files [Array<String>] input files
    # @param options [Hash] see {Sox::Combiner#initialize}
    def initialize(input_files, options)
      @input_files = input_files
      @options     = options
    end

    # Run the command, and save output in the output file.
    #
    # @param output_file [String]
    #
    # @return [void]
    def write(output_file)
      raise NotImplementedError, __method__
    end


    # Build effects which will be applied on final output.
    #
    # @return [Hash]
    def output_effects
      {:norm => @options[:norm]}
    end

    # Build global options for +sox+ command.
    #
    # @return [Hash]
    def output_options
      {:combine => @options[:combine]}
    end
  end
end
