module PDFMeta
  class Results
    class FileSize < Virtus::Attribute

      def coerce(value)
        value.to_i
      end

    end
  end
end