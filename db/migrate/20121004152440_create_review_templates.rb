class CreateReviewTemplates < ActiveRecord::Migration
  def change
    create_table :review_templates do |t|
      t.text :template
      t.timestamps
    end
  end
end
