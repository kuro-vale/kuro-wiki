# frozen_string_literal: true

# Add cateogires to wikis
class AddCategoryToWiki < ActiveRecord::Migration[7.0]
  def change
    add_column :wiki, :category, :integer
  end
end
