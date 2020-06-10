#if  mostly ruby code use a helper, if mostly html use a partial
module ApplicationHelper
	def login_helper style
		if current_user.is_a?(User)
			(button_to 'Log out', destroy_user_session_path, method: :delete, class: style) + " ".html_safe + (link_to 'Edit', edit_user_registration_path, class: style)		
			else 
			(link_to 'Log in', new_user_session_path, class: style) + "	".html_safe + (link_to 'Sign up', new_user_registration_path, class: style)
			end
	end
	def source_helper
		if session[:source]
		greeting = "Thanks for visiting me from #{session[:source]}"
		content_tag(:p, greeting)
		end
	end
	


	def navlist_helper ciao
nav_links = ""
ciao.each do |item|
nav_links<<"<li id=#{item[:listid]} class=#{item[:listclass]}><a href='#{item[:url]}'class=#{item[:aclass]}><i class='#{item[:icon]}'></i>#{item[:title]}</a></li>"
	end
	nav_links.html_safe
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

	def nestedleave_domain ciao
		nested_links = ""
			l = ciao.first[:listclass]
			i = ciao.first[:listid]
			nested_links <<"<li id=#{i} class=#{l} >"
			nested_links << (link_to "Leave Portal" , about_url(subdomain: 'www'))
			nested_links <<"</li>"
			nested_links.html_safe
	end




	def nav_items 
		[
			{
				title: 'Home',
				listid: "menu-item-185",
				listclass: "menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-170",
				icon: :nil,
				url: root_path,
				aclass: :nil
			},
			
		]
	end	
def nav_toggled 
		[
			{
				title: 'About us',
				listid: "menu-item-185",
				listclass: "menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-170",
				icon: :nil,
				#obfx-menu-icon fa fa-flash
				url: root_path,
				aclass: :nil
			},
			{
				title: 'How we value your privacy',
				listid: "menu-item-185",
				listclass: "menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-170",
				icon: :nil,
				url: '',#root_path(@current_user, format: 'pdf'),
				aclass: :nil
			},
		]
	end	
	


def sidebar_dashboard
		[
			{
				title: 'Online Shop',
				listid: :nil,
				listclass: 'nav-item',
				icon: "fa fa-shopping-cart",
				url: spree_path,
				aclass: "dropdown-item"
			},
			{
				title: 'Tickets',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-sticky-note fa-1x",
				url: "",
				aclass: "dropdown-item"
			},
			{
				title: 'Home',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-home fa-1x",
				url: dashboard_path,
				aclass: "dropdown-item"
			}
			

		]
	end	

	def sidebar01
		[
			{
				title: 'Maintenance',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-wrench fa-1x",
				url: maintenances_path,
				aclass: "dropdown-item"
			},
			{
				title: 'Task',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-wrench fa-1x",
				url: tasks_path,
				aclass: "dropdown-item"
			}
		]
	end	


extend ActiveSupport::Concern
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

	def nestedleave_domain ciao
		nested_links = ""
			l = ciao.first[:listclass]
			i = ciao.first[:listid]
			nested_links <<"<li id=#{i} class=#{l} >"
			nested_links << (link_to "Leave Portal" , about_url(subdomain: 'www'))
			nested_links <<"</li>"
			nested_links.html_safe
	end

	def menu01
		[
			{
				title: 'Home',
				listid: "menu-item-170",
				listclass: "menu-item menu-item-type-custom menu-item-object-custom="" menu-item-has-children="" menu-item-170",
				icon: "",
				url: root_path
			}
		]
	end	
	
	def menu02
		[	
			{
				title: 'Access',
				listid: "menu-item-110",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-103 dropdown",
				icon: "",
				url: root_path
			}
		]
	end
	def menu03
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
	def menu04
		[
			{
				title: 'Dashboard',
				listid: "menu-item-110",
				listclass: "dropdown",
				icon: "",
				url: dashboard_path
			}
		]
	end	

	def menu010401
		[
			{
				title: 'Log In',
				listid: "menu-menu-111",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-111",
				method: "",
				url: new_user_session_path
			},
			{
				title: 'Sign up',
				listid: "menu-item-112",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-112",
				method: "",
				url: new_user_registration_path
			},

		]
	end
	def menu010402
		[
			{
				title: 'Edit',
				listid: "menu-menu-113",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-113",
				method: "",
				url: edit_user_registration_path
			},
			{
				title: 'Log out',
				listid: "menu-item-114",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-114",
				method: "delete",
				url: destroy_user_session_path
			},

		]
	end




	def menu0102
		[
			{
				title: 'Smart',
				listid: "menu-item-114",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-114",
				method: "",
				url: root_path
			},
			{
				title: 'Calibration',
				listid: "menu-item-114",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-114",
				method: "",
				url: root_path
			}

		]
	end	
	def menu0103
			[
				{
					title: 'Delivered projects',
					listid: "menu-item-101",
					listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-101",
					method: "",
					url: root_path
				},
				{
					title: 'Status of your project',
					listid: "menu-item-102",
					listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-102",
					method: "",
					url: ""
				}
			]
		end	

def sidebar_dashboard
		[

			{
				title: 'Tickets',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-sticky-note fa-1x",
				url: "",
				aclass: "dropdown-item"
			},
			{
				title: 'Home',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-home fa-1x",
				url: dashboard_path,
				aclass: "dropdown-item"
			}
			

		]
	end	

	def sidebar01
		[
			{
				title: 'Maintenance',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-wrench fa-1x",
				url: maintenances_path,
				aclass: "dropdown-item"
			},
			{
				title: 'Task',
				listid: :nil,
				listclass: "nav-item",
				icon: "fa fa-wrench fa-1x",
				url: tasks_path,
				aclass: "dropdown-item"
			}
		]
	end	


end