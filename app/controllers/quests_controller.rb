class QuestsController < ApplicationController
  before_action :set_quest, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @quests = Quest.all
    @geocoded_quests = Quest.geocoded.where.not(progress: ["Finished", "Cancelled"], user: current_user)
    @markers = @geocoded_quests.map do |quest|
      {
        lat: quest.latitude,
        lng: quest.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { quest: quest }),
        image_url: helpers.asset_url(quest.category.picture)
      }
    end
  end

  def show
    if user_signed_in? && current_user != @quest.user
      @user_participations = Participation.where(user_id: current_user.id)
      if @user_participations.where(quest_id: @quest.id) == []
        @user_joined_quests = nil
      else
        @user_joined_quests = Participation.where(user_id: current_user.id)
      end
    else
      @user_joined_quests = nil
    end
    @user_joined_quests
    # Logique mise dans le modele :
    # qm_ratings = []
    # @quest.user.quests.each do |quest|
    #   quest.participations.where.not(quest_review: nil).each do |participation|
    #     qm_ratings << participation.quest_review.rating.to_i
    #   end
    # end

    # if qm_ratings.empty?
    #   @questmaster_average_rating = nil
    # else
    #   @questmaster_average_rating = qm_ratings.sum / qm_ratings.count
    # end
    # @questmaster_average_rating
  end

  def filter_by_category
    place = params[:query]

    category = Category.find(params[:category_id])
    if place == "empty"
      @quests = category.quests
    else
      @quests = category.quests.near(place, 10)
    end
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end
end
