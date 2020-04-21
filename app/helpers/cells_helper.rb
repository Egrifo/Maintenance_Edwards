module CellsHelper
	
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
			nested_links << (link_to "Leave Portal" , about_url(subdomain: ''))
			nested_links <<"</li>"
			nested_links.html_safe
	end

	def consultancy_menu01
		[
			{
				title: 'Home',
				listid: "menu-item-170",
				listclass: "menu-item menu-item-type-custom menu-item-object-custom="" menu-item-has-children="" menu-item-170",
				icon: "",
				url: ""
			}
		]
	end	
	def consultancy_menu02
		[
			{
				title: 'Maintenance',
				listid: "menu-item-114",
				listclass: "dropdown",
				icon: "",
				url: ""
			}
		]
	end	
	def consultancy_menu03
		[
			{
				title: 'Calibration',
				listid: "menu-item-110",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-103 dropdown",
				icon: "",
				url: ""
			}
		]
	end
	def consultancy_menu04
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
	def consultancy_menu0102
		[
			{
				title: 'List all tasks',
				listid: "menu-item-114",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-114",
				method: "",
				url: cells_path
			},
			{
				title: 'List all equipments',
				listid: "menu-item-114",
				listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-114",
				method: "",
				url: equipment_index_path
			},

		]
	end	
	def consultancy_menu0103
			[
				{
					title: 'Equipment List',
					listid: "menu-item-101",
					listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-101",
					method: "",
					url: ""
				},
				{
					title: 'Status of your project',
					listid: "menu-item-102",
					listclass: "menu-item menu-item-type-post_type menu-item-object-page menu-item-102",
					method: "",
					url: ""
				},
			]
		end	

	def consultancy_menu010401
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
	def consultancy_menu010402
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
	def business_submenu_products
		[
			{
				title: 'Home',
				listid: "",
				listclass: "",
				icon: "",
				#obfx-menu-icon dashicons dashicons-admin-tools"
				url: ""
			},
			{
				title: 'Products',
				listid: '',
				listclass: 'active',
				icon: "",
				#obfx-menu-icon dashicons dashicons-admin-tools"
				url: ""
			},

		]
	end	
def business_submenu_about_us
		[
			{
				title: 'Home',
				listid: "",
				listclass: "",
				icon: "",
				#obfx-menu-icon dashicons dashicons-admin-tools"
				url: ""
			},
			{
				title: 'About us',
				listid: '',
				listclass: 'active',
				icon: "",
				#obfx-menu-icon dashicons dashicons-admin-tools"
				url: ""
			},

		]
end	
end
