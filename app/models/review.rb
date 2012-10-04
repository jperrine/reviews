class Review < ActiveRecord::Base
  attr_accessible :title, :body, :user_identifier, :reviewable_object_id
  belongs_to :reviewable_object
end
