class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.date :date
      t.string :project
      t.string :from_user
      t.string :category
      t.string :message
      t.string :action_plan

      t.timestamps
    end
  end
end
