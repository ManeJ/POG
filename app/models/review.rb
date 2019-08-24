class Review < ApplicationRecord
  validates :rating, :content, presence: true
  validates :content, length: { maximum: 200 }

  def blank_stars
    5 - rating.to_i
  end

  def editable?
    return true if (Time.now - created_at) < (24*60*60)
  end
end
