class ReviewableObject < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :user
  has_many :reviews
  has_one :review_template

  accepts_nested_attributes_for :review_template
end
