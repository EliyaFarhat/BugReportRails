class AddStatusToBugReports < ActiveRecord::Migration[7.1]
  def change
    add_column :bug_reports, :status, :string, default: "Open"
  end
end
