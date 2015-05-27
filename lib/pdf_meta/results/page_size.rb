module PDFMeta
  class Results
    class PageSize
      include Virtus.model

      attribute :height, Float
      attribute :width,  Float
      attribute :units,  String

      def initialize(value)
        self.units   = value.split(' ').last
        self.height  = value.split(' ')[0]
        self.width   = value.split(' ')[2]
      end

    end
  end
end