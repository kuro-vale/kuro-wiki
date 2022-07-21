# rubocop:disable Rails/NotNullColumn
# frozen_string_literal: true

# Add user relation to wikis
class AddUserToWiki < ActiveRecord::Migration[7.0]
  def change
    add_reference :wiki, :user, null: false, foreign_key: true
  end
end
# rubocop:enable Rails/NotNullColumn
