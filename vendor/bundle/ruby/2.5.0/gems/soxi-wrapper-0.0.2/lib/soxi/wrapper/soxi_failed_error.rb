module Soxi
  module Wrapper
    class SoxiFailedError < StandardError
      attr_reader :std_err, :std_out, :option, :filename
      def initialize(std_err: nil,
                     std_out: nil,
                     option: nil,
                     filename: nil)
        @std_err  = std_err
        @std_out  = std_out
        @option   = option
        @filename = filename
      end
    end
  end
end
