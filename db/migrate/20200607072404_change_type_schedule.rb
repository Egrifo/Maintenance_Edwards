class ChangeTypeSchedule < ActiveRecord::Migration[5.2]
  def change
  	  change_column :tasks, :schedule, :string
  end
end
