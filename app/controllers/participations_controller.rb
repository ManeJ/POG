class ParticipationsController < ApplicationController
  before_action :set_participations, only: [:show, :edit, :update, :destroy]

  def index
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

  private

  def set_participation
    @participation = Participation.find(params[:id])
    authorize(@participation)
  end

  def participation_params
    params.require(:participation).permit()
  end
end
