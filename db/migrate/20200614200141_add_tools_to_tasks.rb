class AddToolsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :tool_id, :integer
  end
end
