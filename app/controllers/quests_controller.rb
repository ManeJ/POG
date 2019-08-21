class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy, :validate]

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

  def validate
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
    # authorize(@quest) > inutile cf n'avons pas encore Pundit
  end

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_on, :duration, :name)
  end
end
