class CreateFeedbackSections < ActiveRecord::Migration
  def change
    create_table :feedback_sections do |t|
      t.integer :feedback_id
      t.text :question
      t.text :answer
      t.integer :rating
      t.integer :question_type

      t.timestamps
    end
  end
end
