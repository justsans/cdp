class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :from_user_id
      t.string :from_user_name
      t.string :from_user_email
      t.integer :status_id

      t.timestamps
    end
  end
end
