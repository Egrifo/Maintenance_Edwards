class RemoveContractToServices < ActiveRecord::Migration[5.2]
  def change
  	remove_column :services, :Contract
  end
end
