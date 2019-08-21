class Questmaster::QuestsController < ApplicationController
  def index
    @quests = current_user.quests
    @participations = current_user.participations
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
  
  def update
    @quest = Quest.find(params[:id])
    @quest.update(quest_params)
    redirect_to questmaster_quests_path
  end
  
  def validate
  end

  private
  
  def set_quest
    @quest = Quest.find(params[:id])
    # authorize(@quest) > inutile cf n'avons pas encore Pundit
  end

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_on, :duration, :category_id)
  end
end