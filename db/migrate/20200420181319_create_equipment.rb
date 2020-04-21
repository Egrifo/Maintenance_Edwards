class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :serial
      t.string :assetno
      t.string :description

      t.timestamps
    end
  end
end
