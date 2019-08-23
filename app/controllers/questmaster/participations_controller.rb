class Questmaster::ParticipationsController < ApplicationController
  def index
    @quest = Quest.find(params[:quest_id])
    @participations = @quest.participations
  end

  private

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_at, :progress, :duration)
  end
end
