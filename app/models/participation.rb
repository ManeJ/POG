class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :quest
  belongs_to :user_review, class_name: 'Review'
  belongs_to :quest_review, class_name: 'Review'
end
