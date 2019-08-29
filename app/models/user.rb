class User < ApplicationRecord
  has_many :quests
  has_many :participations
  has_many :user_reviews, through: :participations
  has_many :quest_reviews, through: :participations
  has_many :messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, uniqueness: { scope: :last_name }
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :role, presence: true

  def level_name
    case self.level
    when 1
      "Baby seed"
    when 2
      "Little bud"
    when 3
      "Happiness flower"
    when 4
      "Compassion garden"
    end
  end

  def player_average_rating
    player_ratings = []
    self.quests.each do |quest|
      quest.participations.where.not(user_review: nil).each do |participation|
        player_ratings << participation.user_review.rating.to_i
      end
    end

    if player_ratings.empty?
      @player_average_rating = nil
    else
      @player_average_rating = player_ratings.sum / player_ratings.count
    end
    @player_average_rating
  end

  def qm_average_rating
    qm_ratings = []
    self.quests.each do |quest|
      quest.participations.where.not(quest_review: nil).each do |participation|
        qm_ratings << participation.quest_review.rating.to_i
      end
    end

    if qm_ratings.empty?
      @qm_average_rating = nil
    else
      @qm_average_rating = qm_ratings.sum / qm_ratings.count
    end
    @qm_average_rating
  end

  def global_rating
    user_ratings = []
    self.quests.each do |quest|
      quest.participations.where.not(user_review: nil).each do |participation|
        user_ratings << participation.user_review.rating.to_i
      end
    end
    self.quests.each do |quest|
      quest.participations.where.not(quest_review: nil).each do |participation|
        user_ratings << participation.quest_review.rating.to_i
      end
    end

    if user_ratings.empty?
      @global_rating = nil
    else
      @global_rating = user_ratings.sum / user_ratings.count
    end
    @global_rating
  end
end
