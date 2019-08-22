class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :quest
  belongs_to :user_review, class_name: 'Review', optional: true
  belongs_to :quest_review, class_name: 'Review', optional: true
  has_many :reviews
end
