class Quest < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :participations
  has_many :reviews, through: :participations

  validates :people_wanted, presence: true, exclusion: { in: [0],
    message: ": at least 1 participant" }
  validates :title, :description, :mode, :category, :location, :begin_on, :duration, presence: true
  # validates :title, uniqueness: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
