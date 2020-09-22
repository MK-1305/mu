require 'shellwords'
require 'open3'
require 'tempfile'

# Wrapper around the +sox+ command line tool.
module Sox
  # Basic SoX error:
  class Error < StandardError
  end

  # The SoX command:
  SOX_COMMAND = 'sox'.freeze
end

require 'sox/file'
require 'sox/shell'
require 'sox/command_builder'
require 'sox/cmd'
require 'sox/combiner'
