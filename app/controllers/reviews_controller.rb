class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [:hide, :approve]

  def index
    respond_to do |format|
      format.html do
        @reviewable_object = current_user.reviewable_objects.find(params[:reviewable_object_id])
        @reviews = @reviewable_object.reviews
      end

      format.json do
        reviewable_object = ReviewableObject.where(widget_key: params[:key]).first unless params[:key].blank?
        if params[:key].blank? || reviewable_object.blank?
          render json: { errors: "Invalid reviewable_object_widget_key" }, status: 406
        else
          render json: reviewable_object.reviews, status: 200
        end
      end
    end
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
        format.json { render json: @review, status: 200 }
      else
        format.json { render json: {errors: "review could not be saved"}, status: 406 }
      end
    end
  end
end
