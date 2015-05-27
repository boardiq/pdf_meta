module PDFMeta
  class Results
    include Virtus.model

    attribute :title,           String
    attribute :author,          String
    attribute :creator,         String
    attribute :producer,        String
    attribute :creation_date,   DateTime
    attribute :mod_date,        DateTime
    attribute :tagged,          Boolean
    attribute :user_properties, Boolean
    attribute :suspects,        Boolean
    attribute :form,            String
    attribute :java_script,     Boolean
    attribute :pages,           Integer
    attribute :encrypted,       Boolean
    attribute :page_size,       PDFMeta::Results::PageSize
    attribute :page_rot,        Integer
    attribute :file_size,       PDFMeta::Results::FileSize
    attribute :optimized,       Boolean
    attribute :pdf_version,     Float

  end
end