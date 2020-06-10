class ChangeDepositToBeDecimalInContracts < ActiveRecord::Migration[5.2]
  def change
  	  change_column :contracts, :deposit, :decimal
  end
end
