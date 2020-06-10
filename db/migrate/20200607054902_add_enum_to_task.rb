class AddEnumToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :schedule, :integer
  end
end
