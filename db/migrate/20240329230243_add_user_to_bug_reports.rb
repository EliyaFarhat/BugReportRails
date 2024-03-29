class AddUserToBugReports < ActiveRecord::Migration[7.1]
  def change
    add_column :bug_reports, :user, foreign_key: true
  end
end
