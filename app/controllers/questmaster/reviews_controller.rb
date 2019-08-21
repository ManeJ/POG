class Questmaster::ReviewsController < ApplicationController
  def new
  end

  private

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_at, :progress, :duration)
  end


end
