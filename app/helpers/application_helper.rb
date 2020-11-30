module ApplicationHelper

	def login_helper style
		if current_user.is_a?(User)
			(button_to 'Log out', destroy_user_session_path, method: :delete, class: style) + " ".html_safe + (link_to 'Edit', edit_user_registration_path, class: style)		
			else 
			(link_to 'Log in', new_user_session_path, class: style) + "	".html_safe + (link_to 'Sign up', new_user_registration_path, class: style)
			end
	end
	
	def navlist_helper ciao
	nav_links = ""
	ciao.each do |item|
	nav_links<<"<li id=#{item[:listid]} class=#{item[:listclass]} ><a href='#{item[:url]}'><i class='#{item[:icon]}'></i>#{item[:title]}</a></li>"
	end
	nav_links.html_safe
	end

	def source_helper 
		if session[:source]
		greeting = "Thanks for visiting me from #{session[:source]}"
		content_tag(:p, greeting)
		end
	end
def nav_items 
		[
			{
				title: 'Home',
				listid: :nil,
				listclass: :nil,
				icon: :nil,
				url: root_path,
			},
			{
				title: 'About Me',
				listid: :nil,
				listclass: :nil,
				icon: :nil,
				url: about_path,
			},
			{
				title: 'Contact',
				listid: :nil,
				listclass: :nil,
				icon: :nil,
				url: root_path,
			},
			{
				title: 'Portfolio',
				listid: :nil,
				listclass: :nil,
				icon: :nil,
				url: root_path,
			},

			
		]
	end

  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Datagentibus', 'All rights reserved'
  end

  def active? path
    "active" if current_page? path
  end

end
