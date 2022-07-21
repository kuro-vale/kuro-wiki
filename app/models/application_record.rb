# frozen_string_literal: true

# Base Active Record
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.translate_enum(enum_name, enum_value)
    I18n.t("#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end
end
