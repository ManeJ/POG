class Review < ApplicationRecord
  has_one :participation
  validates :rating, :content, presence: true
end
