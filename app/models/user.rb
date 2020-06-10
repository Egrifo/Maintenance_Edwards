class User < ApplicationRecord

  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :landlord, :tenant], multiple: false)                                      ##
  ############################################################################################ 

 scope :owners, -> { where(roles: 'landlord') }
 scope :tenants, -> { where(roles: 'tenant') }
 user_sanbiagio = User.owners.find_by(email: 'efisio.gigliotti@edwardsvacuum.com')
#if user.spree_roles:nil
#user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')
#end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
validates_presence_of :name

  def first_name
  	self.name.split.first
  end
  has_many :services
  has_many :contracts


  accepts_nested_attributes_for :services, reject_if: :all_blank, allow_destroy: true
end
