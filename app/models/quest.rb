class Quest < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :participations
  has_many :quest_reviews, through: :participations

  validates :people_wanted, presence: true, exclusion: { in: [0],
    message: ": at least 1 participant" }
  validates :title, :description, :mode, :category, :address, :begin_on, :duration, presence: true
  validates :description, length: { maximum: 200 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    participations = self.participations
    reviewed_participations = participations.where.not(quest_review_id: nil)
    ratings = []
    average_rating = 0
    unless reviewed_participations.nil?
      reviewed_participations.each do |participation|
        ratings << participation.quest_review.rating
        average_rating = (ratings.sum / ratings.count).to_i
      end
    end
    average_rating
  end
end
