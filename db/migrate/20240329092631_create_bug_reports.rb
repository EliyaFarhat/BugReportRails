class CreateBugReports < ActiveRecord::Migration[7.1]
  def change
    create_table :bug_reports do |t|
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
