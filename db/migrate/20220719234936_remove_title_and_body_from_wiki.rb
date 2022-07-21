# frozen_string_literal: true

# Title and body now will be accesed through title_en and body_en
class RemoveTitleAndBodyFromWiki < ActiveRecord::Migration[7.0]
  def change_table(_wiki)
    remove_column :title, :string
    remove_column :body, :string
  end
end
