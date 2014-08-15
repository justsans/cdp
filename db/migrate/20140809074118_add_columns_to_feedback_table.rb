class AddColumnsToFeedbackTable < ActiveRecord::Migration
  def up
    add_column :feedbacks, :from_user_role, :string
    add_column :feedbacks, :project, :string
    add_column :feedbacks, :date_requested, :date
  end

  def down
    remove_column :feedbacks, :from_user_role
    remove_column :feedbacks, :project
    remove_column :feedbacks, :date_requested
  end
end
