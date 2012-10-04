class AddApprovedToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :approved, :boolean, default: false
    add_index :reviews, :approved
  end
end
