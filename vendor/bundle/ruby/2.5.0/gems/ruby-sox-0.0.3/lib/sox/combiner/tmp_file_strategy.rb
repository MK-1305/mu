module Sox
  # Combines files using temporary files as mediate files.
  class Combiner::TmpFileStrategy < Combiner::BaseStrategy
    # Type of temporary mediate files:
    MEDIATE_TYPE = :raw

    # Number of bits for temporary mediate files:
    MEDIATE_BITS = 16

    # Encoding of temporary mediate files:
    MEDIATE_ENCODING = :signed


    # :nodoc:
    def write(output_file)
      tmp_files = []

      @input_files.each do |input_file|
        tmp_output_file = gen_tmp_filename
        tmp_files << tmp_output_file

        cmd = build_convert_command(input_file, tmp_output_file)
        sh(cmd)
      end

      cmd = build_output_command(tmp_files, output_file)
      sh(cmd)
    ensure
      # Remove temporary files
      tmp_files.each { |file| FileUtils.rm(file) if ::File.exists?(file) }
    end

    # Build +sox+ command to get final output.
    #
    # @param input_files [Array<String>]
    # @param output_file [String]
    #
    # @return [String] sox command
    def build_output_command(input_files, output_file)
      inputs = input_files.map do |path|
        Sox::File.new(path,
          :type     => MEDIATE_TYPE,
          :encoding => MEDIATE_ENCODING,
          :bits     => MEDIATE_BITS,
          :channels => @options[:channels],
          :rate     => @options[:rate])
      end

      output = Sox::File.new(output_file)

      builder = CommandBuilder.new(inputs, output, output_options, output_effects)
      builder.build
    end
    private :build_output_command

    # Build shell command which converts input file into temporary file with
    # desired rate and channels.
    #
    # @param input_file [String] input file
    # @param output_file [String] converted output with desired characteristics
    #
    # @return [String] shell command
    def build_convert_command(input_file, output_file)
      builder = CommandBuilder.new([Sox::File.new(input_file)], Sox::File.new(output_file))
      builder.effects = {:channels => @options[:channels], :rate => @options[:rate]}
      builder.build
    end
    private :build_convert_command

    # Generate path to temporary file with unique name.
    #
    # @return [String] path to temporary file
    def gen_tmp_filename
      Dir::Tmpname.make_tmpname ['/tmp/ruby-sox', ".#{MEDIATE_TYPE}"], nil
    end
    private :gen_tmp_filename
  end
end
