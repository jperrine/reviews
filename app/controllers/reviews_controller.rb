class ReviewsController < ApplicationController

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
