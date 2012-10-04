class ReviewsController < ApplicationController

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

  def index
    reviewable_object = ReviewableObject.where(widget_key: params[:key]).first unless params[:key].blank?

    respond_to do |format|
      if params[:key].blank? || reviewable_object.blank?
        format.json { render json: {errors: "Invalid reviewable_object_widget_key"}, status: 406 }
      else
        format.json { render json: reviewable_object.reviews, status: 200 }
      end
    end
  end
end
