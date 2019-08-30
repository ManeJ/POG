class Questmaster::QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update]
  def index
    @quests = current_user.quests.order(created_at: :desc)
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
      @chat_room = ChatRoom.create(quest_id: @quest.id, name: @quest.title)
      @chat_room.save
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
    level_up
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

  def level_up
    @participations = @quest.participations
    @quest.update(quest_params)
    @participations.each do |participation|
      if participation.user.xp > 250
        participation.user.level = 2
        participation.user.save
      elsif participation.user.xp > 700
        participation.user.level = 3
        participation.user.save
      elsif participation.user.xp > 1200
        participation.user.level = 4
        participation.user.save
      elsif participation.user.xp > 2000
        participation.user.level = 5
        participation.user.save
      end
    end
  end



  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:description, :title, :mode, :people_wanted, :address, :progress, :begin_on, :duration, :category_id)
  end
end
