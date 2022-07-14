class Wiki < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 50 }
    validates :body, presence: true
end
