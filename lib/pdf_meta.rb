require "active_support"
require "active_support/core_ext"
require "virtus"
require "open3"
require "pry"

require "pdf_meta/version"

require "pdf_meta/command"
require "pdf_meta/runner"
require "pdf_meta/parser"

require "pdf_meta/results/file_size"
require "pdf_meta/results/page_size"
require "pdf_meta/results"


module PDFMeta
  PopplerMissing              = Class.new(StandardError)
  UnknownError                = Class.new(StandardError)
  UnableToReadFileError       = Class.new(StandardError)
  UnableOpenOutputFileError   = Class.new(StandardError)
  PDFPermissionError          = Class.new(StandardError)
  UnknownPopplerError         = Class.new(StandardError)

  module_function

  def config
    @config ||= {
      command_path: 'pdfinfo'
    }
  end

  def configure &block
    yield(config)
  end

  def read(file)
    raise PopplerMissing unless available?
    out = case file
      when File then file.path
      else file
    end 
    PDFMeta::Command.new(out).run!
  end

  def available?
    @available ||= system("which #{config[:command_path]}")
  end


end
