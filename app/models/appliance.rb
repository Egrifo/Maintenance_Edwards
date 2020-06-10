class Appliance < ApplicationRecord
	#belongs_to :transaction
	has_many :transactions
  	has_many :contracts, through: :transactions
end
