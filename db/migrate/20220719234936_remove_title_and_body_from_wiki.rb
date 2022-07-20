class RemoveTitleAndBodyFromWiki < ActiveRecord::Migration[7.0]
  def change
    remove_column :wiki, :title, :string
    remove_column :wiki, :body, :string
  end
end
