class AddUserToWiki < ActiveRecord::Migration[7.0]
  def change
    add_reference :wiki, :user, null: false, foreign_key: true
  end
end
