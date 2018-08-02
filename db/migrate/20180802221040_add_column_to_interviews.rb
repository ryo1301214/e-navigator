class AddColumnToInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :permission, :integer, default: 0
  end
end
