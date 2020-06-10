class Contract < ApplicationRecord
	belongs_to :service
	belongs_to :user
	
	
	has_many :maintenances, inverse_of: :contract
	#has_many :verifications#, inverse_of: :contract
	has_many :verifications, through: :maintenances
	#accepts_nested_attributes_for :maintenances, 
	#							   reject_if: lambda {|attr| attr['verification_id'].blank?}, allow_destroy: true


	has_many :transactions, inverse_of: :contract
  	has_many :appliances, through: :transactions
	accepts_nested_attributes_for :transactions, 
								   reject_if: lambda {|attr| attr['appliance_id'].blank?}, allow_destroy: true


	enum status: {draft: 0, signed: 1} 
	def self.with_appliances
		include(:appliances).where.not(appliances: {id: nil})
	end

	mount_uploader :thumb_image, ContractUploader
	#mount_uploader :main_image, ContractUploader
	#for paperclip
	#has_attached_file :registration
	#validates_attachment_content_type :registration, :content_type=>['application/pdf'], :allow_nil => true

	def download_file
	  upload = Contract.find(params[:id])
	  send_file upload.thumb_image.url
	end
	#def s3_path(style: nil)
    #asset.s3_object(style).presigned_url("get", expires_in: 10.seconds)
  	#end

  	#def s3_download_path
    #asset.s3_object.presigned_url("get", expires_in: 30.seconds)
  	#end
end
