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
	def nestedlist_helper ciao, helper
		nested_links = ""
			l = ciao.first[:listclass]
			u = ciao.first[:url]
			t = ciao.first[:title]
			i = ciao.first[:listid]
			nested_links << "<li id=#{i} class=#{l}} ><a class='dropdown-toggle' data-toggle='dropdown' href='#{u}' >#{t}<span></span></a></a><ul class='dropdown-menu'>"
			helper.each do |nested|
			nested_links<<"<li class=#{nested[:listclass]} id=#{nested[:listid]} ><a href='#{nested[:url]}' ><i class='#{nested[:icon]}'></i>#{nested[:title]}</a></li>"
		end
		nested_links << "</ul></li>"
	nested_links.html_safe
	end
	
	def nestedlogin_helper ciao, helper
		nested_links = ""
			l = ciao.first[:listclass]
			i = ciao.first[:listid]
			u = ciao.first[:url]
			t = ciao.first[:title]
			ll = helper.first[:listclass]
			ii = helper.first[:listid]
			nested_links << "<li id=#{i} class=#{l}}} ><a class='dropdown-toggle' data-toggle='dropdown' href='#{u}' >#{t}<span></span></a></a><ul class='dropdown-menu'>"
			nested_links <<"<li id=#{ii} class=#{ll}}} >"
			nested_links << (login_helper ll)
			nested_links <<"</li></ul></li>"
			nested_links.html_safe
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
	def menu04
		[
			{
				title: 'Access',
				listid: "menu-item-110",
				listclass: "dropdown",
				icon: "",
				url: ""
			}
		]
	end	
	def menu010401
		[
			{
				title: 'Log In',
				listid: :nil,
				listclass: :nil,
				method: "",
				url: new_user_session_path
			},
			{
				title: 'Register',
				listid: :nil,
				listclass: :nil,
				method: "",
				url: new_user_registration_path
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
