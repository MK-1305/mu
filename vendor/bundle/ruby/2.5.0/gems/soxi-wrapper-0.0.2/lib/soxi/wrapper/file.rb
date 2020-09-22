require 'open3'
require "soxi/wrapper/soxi_failed_error"

module Soxi
  module Wrapper
    class File
      attr_reader :filename
      def initialize filename
        @filename = filename
      end

      def filetype
        @filetype ||= run('t')
      end

      def samplerate
        @samplerate ||= run('r')
      end

      def channels
        @channels ||= run('c').to_i
      end

      def samples
        @samples ||= run('s').to_i
      end

      def duration
        @duration ||= run('d')
      end

      def seconds
        @seconds ||= run('D').to_f
      end

      def bits_per_sample
        @bits_per_sample ||= run('b').to_i
      end

      def average_bitrate
        @average_bitrate ||= run('B')
      end

      def encoding
        @encoding ||= run('e')
      end

      def comments
        @comments ||= run_multiline('a')
      end

      private

      def run_multiline(option)
        run_soxi(option)
      end

      def run(option)
        run_soxi(option).delete("\n")
      end

      def run_soxi(option)
        val, std_err, status = Open3.capture3('soxi', "-#{option}", filename)
        return val if status.success?
        raise SoxiFailedError.new(
          std_err: std_err,
          std_out: val,
          option: option,
          filename: filename
        )
      end
    end
  end
end
