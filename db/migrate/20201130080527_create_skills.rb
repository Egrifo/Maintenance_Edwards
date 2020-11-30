class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :percent_utilized
      t.text :badge

      t.timestamps
    end
  end
end
