class Task < ApplicationRecord
	
	enum schedule_type: {consumable: 0, yearly: 1, quarterly: 2, sixmonth: 3, monthly: 4, weekly: 5}
	#enum schedule_type: {0, 1, 2, 3,4, weekly: 5}
	
	#f.input :schedule, :as => :select, :collection => Task.schedule 
	#belongs_to :maintenance
	has_many :verifications
end
