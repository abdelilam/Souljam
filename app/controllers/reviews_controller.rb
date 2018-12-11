class ReviewsController < ApplicationController
  def new
    @jamm = Jamm.find(params[:jamm_id])
    authorize @jamm
    @review = Review.new
  end

  def create
    @jamm = Jamm.find(params[:jamm_id])
    authorize @jamm
    @participation = Participation.all.find_by(user: current_user, jamm: @jamm)
    @review = Review.new(review_params)
    @review.participation = @participation
    if @review.save
      redirect_to jamm_path(@jamm)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
