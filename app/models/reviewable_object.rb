require 'uuidtools'
class ReviewableObject < ActiveRecord::Base
  attr_accessible :name, :moderation, :template

  belongs_to :user
  has_many :reviews

  validates_presence_of :name, :template
  validate :require_token_in_template

  before_create :generate_widget_key

  class << self
    def form_token
      'FORM_TAG'
    end
  end

  def to_html(view)
    template.gsub(/#{self.class.form_token}/, view)
  end

  private

  def require_token_in_template
    unless template =~ /#{self.class.form_token}/
      errors.add(:template, "You must supply the #{self.class.form_token} in your template.")
    end
  end

  def generate_widget_key
    self.widget_key = UUIDTools::UUID.random_create.to_s
  end
end
