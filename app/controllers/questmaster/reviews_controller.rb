class Questmaster::ReviewsController < ApplicationController
  def new
    @quest = Quest.find(params[:quest_id])
    @review = Review.new
  end

  def create
    @quest = Quest.find(params[:quest_id])
    @quest.participations.each do |participation|
      @review = Review.new(review_params)
      if @review.save
        participation.user_review_id = @review.id
        participation.save
        redirect_to questmaster_quest_participations_path
      else
        render :new
      end
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:description, :mode, :people_wanted, :location, :begin_at, :progress, :duration)
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
