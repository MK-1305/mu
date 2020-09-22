module Sox
  # Combines files using process substitution to build and use mediate files.
  # Process substitution is not supported by the standard shell, so we need
  # to pass the final command to bash via shell.
  #
  # Read more about process substitution:
  # http://en.wikipedia.org/wiki/Process_substitution
  class Combiner::ProcessSubstitutionStrategy < Combiner::BaseStrategy
    # Type of mediate files:
    MEDIATE_TYPE = :sox

    # Number of bits for mediate files:
    MEDIATE_BITS = 32

    # Encoding of mediate files:
    MEDIATE_ENCODING = :signed

    # Pseudo file which makes the `sox` command write to output to stdout:
    SOX_PIPE = '-p'

    # :nodoc:
    def write(output_file)
      inputs = @input_files.map { |file| build_input_file(file) }
      output = Sox::File.new(output_file)

      cmd = CommandBuilder.new(inputs, output, output_options, output_effects).build
      bash(cmd)
    end


    # Build the input file which can be used in the command builder to get
    # the final output.
    #
    # @param file_path [String] path to input file
    #
    # @return [Sox::File]
    def build_input_file(file_path)
      Sox::File.new(build_converted_input(file_path),
        :type     => MEDIATE_TYPE,
        :encoding => MEDIATE_ENCODING,
        :bits     => MEDIATE_BITS,
        :channels => @options[:channels],
        :rate     => @options[:rate]
     ).tap { |file| file.escaped = true }
    end
    private :build_input_file

    # Build the shell statement which can be used as the input file with
    # the needed rate and number of channels.
    #
    # @param input_file [String]
    #
    # @return [String] shell statement which can be used as input file
    #
    # @example
    #   build_converted_input("in.mp3")
    #   # => "<(sox in.mp3 --encoding sox --bits 32 -p rate 22100 channels 1)"
    def build_converted_input(input_file)
      input    = Sox::File.new(input_file)
      output   = Sox::File.new(SOX_PIPE, :encoding => MEDIATE_ENCODING, :bits => MEDIATE_BITS)
      effects  = {:channels => @options[:channels], :rate => @options[:rate]}
      command  = CommandBuilder.new([input], output, {}, effects).build
      process_substitution_wrap(command)
    end
    private :build_converted_input

    # Wrap shell command to make its output be used in process substitution.
    # See http://en.wikipedia.org/wiki/Process_substitution for more info.
    #
    # @param command [String] shell command
    #
    # @return [String]
    def process_substitution_wrap(command)
      "<(#{command})"
    end
    private :process_substitution_wrap
  end
end
