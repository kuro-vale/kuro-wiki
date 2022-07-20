class AddTranslationsToWiki < ActiveRecord::Migration[7.0]
  def change
    add_column :wiki, :title_en, :string
    add_column :wiki, :title_es, :string
    add_column :wiki, :body_en, :string
    add_column :wiki, :body_es, :string
  end
end
