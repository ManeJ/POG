class Quest < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :participations
  has_many :reviews, trough: :participations
end
