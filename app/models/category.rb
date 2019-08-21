class Category < ApplicationRecord
  has_many :quests
  validates :name, :picture, :xp, presence: true
end
