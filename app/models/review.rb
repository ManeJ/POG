class Review < ApplicationRecord
  validates :rating, :content, presence: true
  validates :content, length: { maximum: 200 }

  def blank_stars
    5 - rating.to_i
  end
end
