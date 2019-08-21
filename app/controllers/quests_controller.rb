class QuestsController < ApplicationController
  before_action :set_quests, only: [:show, :edit, :update, :destroy, :validate]

  def index
    @quests = Quest.geocoded
    @markers = @quests.map do |quest|
      {
        lat: quest.latitude,
        lng: quest.longitude
      }
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def validate
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
    authorize(@quest)
  end

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_at, :duration)
  end
end
