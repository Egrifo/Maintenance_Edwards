class Service < ApplicationRecord
	#mount_uploader :Contract, Contractuploader
	#serialize :Contract, JSON
	validates :name, :description, presence: true
	validates :description, length: {maximum: 1000, too_long: "(count) characters is the maximum"}
	#belongs_to :user
	has_many :contracts, inverse_of: :service
	accepts_nested_attributes_for :contracts, 
								   reject_if: lambda {|attr| attr['reference'].blank?}, allow_destroy: true
	#accepts_nested_attributes_for :appliances,
	#							  allow_destroy: false
	def self.rent
		where(title: 'rent')
	end
	scope :affitto, -> {where(user_id: current_user.id)}
	scope :mappa, -> { where(user_id: ':id')}
	NAME = %w{casa, smarthome}

end
