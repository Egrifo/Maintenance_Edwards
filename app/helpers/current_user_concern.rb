module CurrentUserConcern
	extend ActiveSupport::Concern

	def guest_user
		OpenStruct.new(name: "Guest", 
						first_name: "Guest", 
						email: "guest@example.com")
	end
end