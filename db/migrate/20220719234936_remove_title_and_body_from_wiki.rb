# frozen_string_literal: true

# Title and body now will be accesed through title_en and body_en
class RemoveTitleAndBodyFromWiki < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      change_table :wiki, bulk: true do |t|
        dir.up do
          t.remove :title
          t.remove :body
        end
      end
    end
  end
end
