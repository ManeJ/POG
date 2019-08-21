class ParticipationsController < ApplicationController
  before_action :set_participations, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
    @user = current_user
    @quest = Quest.find(params[:quest_id])
    @participation = Participation.new()
    @participation.user = @user
    @participation.quest = @quest

    if @participation.save
      redirect_to quest_participation_path(@quest, @participation)
    else
      render :new
    end
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
