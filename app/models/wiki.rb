class Wiki < ApplicationRecord
  include Translatable

  paginates_per 10

  belongs_to :user

  translates :title, :body

  validates :title_en, presence: true
  validates :title_en, length: { maximum: 50 }
  validates :body_en, presence: true
  validates :category, presence: true

  enum category: {
    world: 0,
    art: 1,
    technology: 2,
    history: 3,
    culture: 4,
    business: 5,
    politics: 6,
    philosophy: 7,
    science: 8,
    health: 9,
    religion: 10,
    games: 11
  }
end
