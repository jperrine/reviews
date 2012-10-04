class ReviewTemplate < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :reviewable_object
end
