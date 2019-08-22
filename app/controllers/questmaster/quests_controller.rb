class Questmaster::QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :update]
  def index
    @quests = current_user.quests
    @participations = Participation.all
    @geocoded_quests = Quest.geocoded
    @markers = @geocoded_quests.map do |quest|
      {
        lat: quest.latitude,
        lng: quest.longitude
      }
    end
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def create
    @user = current_user
    @quest = Quest.new(quest_params)
    @quest.user = @user
    if @quest.save
      redirect_to questmaster_quest_path(@quest)
    else
      render :new
    end
  end

  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])
    @participations = @quest.participations
    @participations.each do |participation|
      if participation.user.xp != nil
        participation.user.xp =  participation.user.xp + @quest.category.xp
      else
        participation.user.xp = @quest.category.xp
        participation.user
        participation.user.update(email: participation.user.email, first_name: participation.user.first_name, last_name: participation.user.last_name, username: participation.user.username, role: participation.user.role, telephone: participation.user.telephone, photo: participation.user.photo , entity_photo: participation.user.entity_photo, xp: participation.user.xp, level: participation.user.level)
      end
    end

    redirect_to questmaster_quests_path
  end

  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to questmaster_quests_path
  end


  def validate
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:description, :title, :mode, :people_wanted, :location, :progress, :begin_on, :duration, :category_id)
  end
end
