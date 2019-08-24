class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy, :validate]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @quests = Quest.all
    @geocoded_quests = Quest.geocoded.where.not(progress: ["Finished", "Cancelled"], user: current_user)
    @markers = @geocoded_quests.map do |quest|
      {
        lat: quest.latitude,
        lng: quest.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { quest: quest }),
        image_url: helpers.asset_url(quest.category.picture)
      }
    end
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
    params.require(:quest).permit(:description, :mode, :people_wanted, :address, :begin_on, :duration, :name)
  end
end
