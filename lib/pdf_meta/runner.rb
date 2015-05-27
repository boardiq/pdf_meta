module PDFMeta
  class Runner
  
    attr_reader :output
    def initialize(command)
      stdin, stdout, stderr, wait_thr = Open3.popen3(command)
      @output  = stdout.read
      @error   = stderr.read
      @process = wait_thr.value 
    end

    def success?
      @process.success?
    end

    def error
      error_mapping[@process.exitstatus].new(@error)
    end

    private

      def error_mapping
        @error_mapping ||= Hash.new(UnknownError).merge({
          1 =>  PDFMeta::UnableToReadFileError,
          2 =>  PDFMeta::UnableOpenOutputFileError,
          3 =>  PDFMeta::PDFPermissionError,
          99 => PDFMeta::UnknownPopplerError
        })
      end

  end
end
