class Questmaster::QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update]
  def index
    @quests = current_user.quests
    @participations = Participation.all
    @review = Review.new
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
      redirect_to questmaster_quests_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @participations = @quest.participations
    @quest.update(quest_params)
    if @quest.progress == "Finished"
      @participations.each do |participation|
        participation.user.xp = participation.user.xp + @quest.category.xp
        participation.user.save
      end
    end

    redirect_to questmaster_quests_path
  end

  def destroy
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
    params.require(:quest).permit(:description, :title, :mode, :people_wanted, :address, :progress, :begin_on, :duration, :category_id)
  end
end
