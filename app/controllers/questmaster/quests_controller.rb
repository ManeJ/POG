class Questmaster::QuestsController < ApplicationController
  def index
    @quests = current_user.quests
    @participations = current_user.participations
  end

  def validate
  end

  def update
    @quest = Quest.find(params[:id])
    @quest.update(quest_params)
    redirect_to questmaster_quests_path
  end

  private

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_at, :progress, :duration)
  end


end
