# frozen_string_literal: true

# Add basic translations
class AddTranslationsToWiki < ActiveRecord::Migration[7.0]
  def change_table(_wiki)
    add_column :title_en, :string
    add_column :title_es, :string
    add_column :body_en, :string
    add_column :body_es, :string
  end
end
