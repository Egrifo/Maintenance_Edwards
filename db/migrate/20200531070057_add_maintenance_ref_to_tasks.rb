class AddMaintenanceRefToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :maintenance, foreign_key: true
  end
end
