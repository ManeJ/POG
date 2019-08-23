class Review < ApplicationRecord
  validates :rating, :content, presence: true

  def blank_stars
    5 - rating.to_i
  end
end
