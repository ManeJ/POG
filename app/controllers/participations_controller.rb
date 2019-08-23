class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  def index
    @participations = Participation.where(user_id: current_user.id).order(created_at: :desc)
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
      redirect_to participations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @participation = Participation.find(params[:id])
    @participation.destroy
    redirect_to participations_path
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participation).permit(:user_id, :quest_id, :user_review_id, :quest_review_id)
  end
end
