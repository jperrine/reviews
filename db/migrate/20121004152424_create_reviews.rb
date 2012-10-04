class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :reviewable_object
      t.text :body
      t.string :user_identifier
      t.string :title
      t.timestamps
    end

    add_index :reviews, :reviewable_object_id
  end
end
