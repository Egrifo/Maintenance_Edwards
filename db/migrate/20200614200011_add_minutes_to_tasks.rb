class AddMinutesToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :minutes, :integer
  end
end
