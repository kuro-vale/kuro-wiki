# frozen_string_literal: true

# When requesting title get title_{locale}, default is title_en
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
    self["#{attribute}_#{I18n.locale}"] ||
      self["#{attribute}_#{I18n.default_locale}"]
  end
end
