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
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end
end
