class Transaction < ApplicationRecord
	enum type: {inventory: 0, payment: 1, maintenance: 2} 
	belongs_to :contract#,dependent: :delete
  	#has_one :appliance
  	#belongs_to  :movie
  	belongs_to :appliance
  	#belongs_to :verification
end
