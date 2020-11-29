 module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
		super || guest_user
	end
	def guest_user
		guest = GuestUser.new
		guest.name = "Guest User"
		guest.first_name = "Guest"
		guest.email = "guest@example.com"
		guest
	end
	#included do
	#	before_action :configure_permitted_parameters, if: :devise_controller?
	#end

	#def configure_permitted_parameters
	#devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	#devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	#end 
end