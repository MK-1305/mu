require 'soxi/wrapper/version'
require 'soxi/wrapper/file'
require 'soxi/soxi_missing_error'
require 'soxi/file_missing_error'

module Soxi
  module Wrapper
    def self.file(filename)
      raise SoxiMissingError('Need soxi in path') unless soxi_exists?
      unless ::File.exist?(filename)
        raise FileMissingError("File: #{filename} does not exist")
      end
      Soxi::Wrapper::File.new filename
    end

    def self.soxi_exists?
      `which soxi` != ''
    end
  end
end
