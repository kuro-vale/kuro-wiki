module Translatable
  extend ActiveSupport::Concern
  included do
    def self.translates(*attributes)
      attributes.each do |attribute|
        define_method(attribute) do
          translation_for(attribute)
        end
      end
    end
  end
  def translation_for(attribute)
    read_attribute("#{attribute}_#{I18n.locale}") ||
      read_attribute("#{attribute}_#{I18n.default_locale}")
  end
end
