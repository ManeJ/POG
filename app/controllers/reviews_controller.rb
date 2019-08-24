class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]

  def index
  end

  def show
    @participation = Participation.find(params[:participation_id])
    @quest = Quest.find(@participation.quest.id)
  end

  def new
    @participation = Participation.find(params[:participation_id])
    @quest = @participation.quest
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @participation = Participation.find(params[:participation_id])
    if @review.save
      @participation.quest_review_id = @review.id
      @participation.save
      redirect_to participations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
