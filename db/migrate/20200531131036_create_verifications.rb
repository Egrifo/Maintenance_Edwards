class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.datetime :date
      t.string :signoff
      t.references :maintenance, foreign_key: true, index: true
      t.references :task, foreign_key: true, index: true

      t.timestamps
    end
  end
end
