class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :section_id
      t.boolean :active

      t.timestamps
    end
  end
end
