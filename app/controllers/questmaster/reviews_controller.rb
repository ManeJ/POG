class Questmaster::ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update]
  before_action :set_quest, only: [:new, :create, :edit]
  before_action :set_participation, only: [:edit, :update]

  def new
    @review = Review.new
  end

  def create
    @quest.participations.each do |participation|
      @review = Review.new(review_params)
      if @review.save
        participation.user_review_id = @review.id
        participation.save
      else
        render :new
      end
    redirect_to questmaster_quest_participations_path(@quest) and return #voir note en bas de code
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to questmaster_quest_participations_path(@participation.quest_id)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_quest
    @quest = Quest.find(params[:quest_id])
  end

  def set_participation
    @participation = Participation.find(params[:participation_id])
  end

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_at, :progress, :duration)
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

# "and return" resoud le probleme qui empechait parfois les global reviews
# "redirect_to does not stop execution of the action method so if you call it
# and later call render or another redirect_to you will get the double render exception"
