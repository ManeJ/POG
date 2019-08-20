class Review < ApplicationRecord
  belongs_to :user, through: :participations
  belongs_to :quest, through: :participations
end
