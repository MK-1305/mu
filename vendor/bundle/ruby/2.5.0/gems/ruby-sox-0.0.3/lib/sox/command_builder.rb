module Sox
  # Builds the +sox+ shell command from input files, an output file, options
  # and effects.
  #
  # @example
  #   builder = Sox::CommandBuilder.new(['in1.mp3', 'in2.ogg'], 'out.wav',
  #     {:combine => :mix},
  #     {:rate => 44100, :channels => 2}
  #   )
  #   builder.build  # => "sox --combine mix in1.mp3 in2.ogg out.wav rate 44100 channels 2"
  class CommandBuilder
    attr_accessor :input_files, :output_file, :options, :effects

    # @param input_files [Array<Sox::File>]
    # @param output_file [Sox::File]
    # @param options [Hash{Symbol => Symbol}]
    # @param effects [Hash{Symbol => Symbol}]
    def initialize(input_files, output_file, options = {}, effects = {})
      @input_files = input_files
      @output_file = output_file
      @options     = options
      @effects     = effects
    end

    # Build shell command with all arguments and options.
    #
    # @return [String]
    def build
      [ Sox::SOX_COMMAND,
        build_options(@options),
        build_input_files,
        build_file(@output_file),
        build_effects
      ].flatten.join(' ')
    end


    # Build input files with their options.
    #
    # @return [Array<String>]
    def build_input_files
      @input_files.map { |file| build_file(file) }
    end
    private :build_input_files

    # Build part of SoX command which represents file(input or output).
    #
    # @param file [Sox::File] file
    #
    # @return [String]
    def build_file(file)
      opts = build_options(file.options)
      file_path = file.escaped? ? file.path : Shellwords.escape(file.path)
      [opts, file_path]
    end
    private :build_file

    # Build options with their values (if present) to be used in shell command.
    #
    # @param options [Hash] options
    #
    # @return [Array<String>] options to be concatenated into string
    def build_options(options)
      options.inject([]) do |result, (opt, val)|
        if val
          result << "--#{shellify_opt(opt)}"
          result << shellify_opt(val) if val != true
        end
        result
      end
    end
    private :build_options

    # Build effects with their arguments (if present) to be used in shell command.
    #
    # @return [Array<String>] effects to be concatenated into string
    def build_effects
      @effects.inject([]) do |result, (effect, val)|
        if val
          result << effect
          result << val.to_s if val != true
        end
        result
      end
    end
    private :build_effects

    # Convert option or its value to shell style, separating words with "-".
    #
    # @param value [Symbol, String] option or value
    #
    # @return [String] shellified option
    def shellify_opt(value)
      value.to_s.gsub('_', '-')
    end
    private :shellify_opt
  end
end
