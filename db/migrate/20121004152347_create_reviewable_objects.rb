class CreateReviewableObjects < ActiveRecord::Migration
  def change
    create_table :reviewable_objects do |t|
      t.string :name
      t.string :widget_key
      t.boolean :moderation, default: false
      t.text :template
      t.belongs_to :user
      t.timestamps
    end

    add_index :reviewable_objects, :user_id
  end
end
