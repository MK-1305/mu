module Sox
  # Process audio files using the +sox+ shell command.
  #
  # @example
  #   # Mix 3 files into one
  #   sox = Sox::Cmd.new(:combine => :mix)
  #   sox.add_input("guitar1.flac")
  #   sox.add_input("guitar2.flac")
  #   sox.add_input("drums.flac")
  #   sox.set_output("hell_rock-n-roll.mp3")
  #   sox.set_effects(:rate => 44100, :channels => 2)
  #   sox.run
  class Cmd
    include Sox::Shell

    attr_reader :options, :inputs, :output, :effects

    # @param options [Hash] global options for sox command
    def initialize(options = {})
      @options = options
      @inputs  = []
      @effects = {}
    end

    # Add input file with its options.
    #
    # @param file_path [String] path to file
    # @param input_options [Hash] options for input files, see +man sox+
    #
    # @return [Sox::Cmd] self
    def add_input(file_path, input_options = {})
      @inputs << Sox::File.new(file_path, input_options)
      self
    end

    # Set output file and its options.
    #
    # @param file_path [String] ouput file path
    # @param output_options [Hash] options for output file, see +man sox+
    #
    # @return [Sox::Cmd] self
    def set_output(file_path, output_options = {})
      @output = Sox::File.new(file_path, output_options)
      self
    end

    # Set effects on the output file. See +man sox+ section +EFFECTS+.
    # It receives the effect name as a hash key and the effect arguments as
    # hash values which can be a string or an array of strings. If an effect
    # has no arguments just pass +true+ as the value.
    #
    # @example
    #   # Normalize and use 2 channels for output
    #   sox_cmd.set_effects(:channels => 2, :norm => true)
    #
    # @param effects [Hash{Symbol, String => Symbol, String, Array<String>}]
    #
    # @return [Sox::Cmd] self
    def set_effects(effects)
      @effects = effects
      self
    end

    # Set global options. See +man sox+ section +Global Options+.
    #
    # @param options [Hash] global options for +sox+ command
    #
    # @return [Sox::Cmd] self
    def set_options(options)
      @options = options
      self
    end

    # Run `sox` command. Raise {Sox::Error} on fail.
    #
    # @return [Boolean] true in case of success
    def run
      raise(Sox::Error, "Output is missing, specify it with `set_output`")   unless @output
      raise(Sox::Error, "Inputs are missing, specify them with `add_input`") if @inputs.empty?

      cmd = CommandBuilder.new(@inputs, @output, @options, @effects).build
      sh(cmd)
    end

    # Return the sox command that will be passed to shell.
    #
    # @return [String]
    def to_s
      CommandBuilder.new(@inputs, @output, @options, @effects).build
    end
  end
end
