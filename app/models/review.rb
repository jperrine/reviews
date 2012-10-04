class Review < ActiveRecord::Base
  attr_accessible :title, :body, :user_identifier, :reviewable_object_id
  belongs_to :reviewable_object

  def approve
    self.approved = true
  end

  def hide
    self.approved = false
  end

  def as_json(options)
    hash = attributes.except("reviewable_object_id")
    hash.merge(reviewable_object_key: reviewable_object.widget_key)
  end
end
