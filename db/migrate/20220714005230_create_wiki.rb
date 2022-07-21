# frozen_string_literal: true

# Create app essential model
class CreateWiki < ActiveRecord::Migration[7.0]
  def change
    create_table :wiki do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
