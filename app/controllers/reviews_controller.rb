class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :hide, :approve]

  def index
    @reviewable_object = current_user.reviewable_objects.find(params[:reviewable_object_id])
    @reviews = @reviewable_object.reviews
  end

  def hide
    @review = current_user.reviews.find(params[:id])
    @review.hide
    @review.save

    redirect_to [@review.reviewable_object, :reviews]
  end

  def approve
    @review = current_user.reviews.find(params[:id])
    @review.approve
    @review.save

    redirect_to [@review.reviewable_object, :reviews]
  end

  def create
    @review = Review.new(params[:review])
    respond_to do |format|
      if @review.save
        format.json { render json: {}, status: 200 }
      else
        format.json { render json: {}, status: 406 }
      end
    end
  end
end
