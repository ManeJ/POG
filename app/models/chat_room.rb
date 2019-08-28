class ChatRoom < ApplicationRecord
  belongs_to :quest
  has_many :users
  has_many :messages, dependent: :destroy
end
