module Sox
  # Combines input files. Technically it calls +sox+ with +--combine+ option,
  # but allows you not to care about the rates and numbers of channels in the
  # input files. It converts them to the same rates/channels using temporary
  # mediate files.
  #
  # @example
  #   # Concatenate
  #   combiner = Sox::Combiner.new(['in1.mp3', 'in2.ogg', 'in3.wav'], :combine => :concatenate)
  #   combiner.write('out.mp3')
  class Combiner

    autoload :BaseStrategy               , 'sox/combiner/base_strategy'
    autoload :TmpFileStrategy            , 'sox/combiner/tmp_file_strategy'
    autoload :ProcessSubstitutionStrategy, 'sox/combiner/process_substitution_strategy'

    # Default options
    DEFAULT_OPTIONS = {
      # Method to be used for combining sounds. See --combine of sox tool.
      :combine => :concatenate,

      # Number of channels in the output file.
      :channels => 1,

      # Rate(samples per seconds) of the output file.
      :rate => 22050,

      # Apply norm effect on output.
      :norm => false,

      # Strategy to convert input files into files with the same rates
      # and channels.
      :strategy => :process_substitution
    }

    # Mapping of strategy names and their implementations
    STRATEGIES = {
      :tmp_file             => TmpFileStrategy,
      :process_substitution => ProcessSubstitutionStrategy
    }


    # @param input_files [Array<String>] input files
    # @param options [Hash]
    #
    # @option options :combine [Symbol] value for +--combine+ sox option.
    #   Use underscore instead of hyphen, e.g. :mix_power.
    # @option options :channels [Integer] number of channels in output file.
    # @option options :rate [Integer] rate of output file
    # @option options :norm [Boolean] apply +norm+ effect on output.
    # @option options :strategy [Symbol] strategy to treat temporary files,
    #   default is :process_substitution which reduces disk IO.
    def initialize(input_files, options = {})
      raise(ArgumentError, "Input files are missing") if input_files.empty?

      opts           = DEFAULT_OPTIONS.merge(options)
      strategy_name  = opts.delete(:strategy)
      strategy_class = STRATEGIES[strategy_name]
      raise(ArgumentError, "Unknown strategy #{strategy_name.inspect}") unless strategy_class

      @strategy      = strategy_class.new(input_files, opts)
    end

    # Run +sox+ command and write output to file.
    #
    # @param output_file [String] path of output file
    #
    # @return [void]
    def write(output_file)
      @strategy.write(output_file)
    end
  end
end
