class MainController < ApplicationController

  protect_from_forgery prepend: true
layout 'application'
	def home
	end
	def origin
	end
	def contact		
	end
	def about	
		@skills = Skill.all
	end
	def tech_news
	end
end
