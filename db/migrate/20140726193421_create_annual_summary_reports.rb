class CreateAnnualSummaryReports < ActiveRecord::Migration
  def change
    create_table :annual_summary_reports do |t|
      t.integer :user_id
      t.string :title
      t.integer :year
      t.integer :status

      t.timestamps
    end
  end
end
