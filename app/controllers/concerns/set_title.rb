module SetTitle
	#this module is applied in order to control permissions
	extend ActiveSupport::Concern

	included do
		before_action :current_user
		before_action :set_title

	end

	def set_title
		@page_title = " San Biagio "
		if current_user.is_a?(User)
			if current_user.has_roles?(:landlord)  
			@page_title = " Datagentibus Home "
			end
		end	
			
		
	end
end