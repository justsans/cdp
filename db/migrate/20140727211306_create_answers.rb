class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :annual_summary_report_id
      t.integer :question_id
      t.string :answer
      t.string :question
      t.integer :section_id

      t.timestamps
    end
  end
end
