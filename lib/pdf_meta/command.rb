module PDFMeta
  class Command

    def initialize(path='', options={})
      raise ArgumentError  if path.empty?

      @path    = path
      @options = default_options.merge(options)
    end

    def run!
      runner = PDFMeta::Runner.new(command)
      if runner.success?
        PDFMeta::Parser.new(runner.output).results
      else
        raise runner.error
      end
    end

    private

      def command
        [@options[:command], @options[:switches], @path].compact.join(' ')
      end

      def default_options
        {
          command: 'pdfinfo',
          switches: nil
        }
      end

  end
end