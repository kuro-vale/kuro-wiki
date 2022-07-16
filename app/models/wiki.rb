class Wiki < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :body, presence: true
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
  }, _prefix: true
end
