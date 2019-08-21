class User < ApplicationRecord
  has_many :quests
  has_many :participations
  has_many :reviews, through: :participations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, uniqueness: { scope: :last_name }
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :role, presence: true
end
