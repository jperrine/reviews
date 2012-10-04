class WidgetsController < ApplicationController
  layout 'widget'

  def index
    @reviewable_object = ReviewableObject.where(widget_key: params[:key]).first
    @review = @reviewable_object.reviews.new
    @review.user_identifier = params[:user]
  end
end
