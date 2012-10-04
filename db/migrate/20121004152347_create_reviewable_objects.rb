class CreateReviewableObjects < ActiveRecord::Migration
  def change
    create_table :reviewable_objects do |t|
      t.string :name
      t.string :widget_key
      t.boolean :moderation, default: false
      t.integer :review_template_id
      t.belongs_to :user
      t.timestamps
    end

    add_index :reviewable_objects, :review_template_id
  end
end
