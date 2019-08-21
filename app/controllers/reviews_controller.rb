class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :edit, :update]

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

  private

  def set_review
    @review = Review.find(params[:id])
    authorize(@review)
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
