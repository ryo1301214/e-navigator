class RemoveColumnFromInterviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :interviews, :permission, :boolean
  end
end
