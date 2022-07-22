# frozen_string_literal: true

# Add basic translations
class AddTranslationsToWiki < ActiveRecord::Migration[7.0]
  def change
    change_table :wiki, bulk: true do |t|
      t.string :title_en
      t.string :title_es
      t.string :body_en
      t.string :body_es
    end
  end
end
