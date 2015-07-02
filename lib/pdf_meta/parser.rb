module PDFMeta
  class Parser
    
    def initialize(output)
      @output = output
    end

    def results
      @results ||= PDFMeta::Results.new(parsed_output)
    end

    private

    def parsed_output
      out = @output.split("\n").map {|x| x.split(':', 2)}.reject(&:empty?)
      hash = {}
      out = out.each do |row|
        hash[row.first.underscore.parameterize.underscore.to_sym] = row.last.strip
      end
      hash.reject {|k, v| v.blank?}
    end

  end
end