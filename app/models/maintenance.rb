class Maintenance < ApplicationRecord
	#belongs_to :service#, dependent: :delete#,:destroy,#:nullify
  	belongs_to :contract
  	has_many :verifications, inverse_of: :maintenance
  	has_many :tasks, through: :verifications, dependent: :destroy
  	#
	accepts_nested_attributes_for :verifications, 
								   reject_if: lambda {|attr| attr['task_id'].blank?}, allow_destroy: true

  	scope :planned, -> { where(starting_date:  nil) }
#accepts_nested_attributes_for :transactions, 
#								   reject_if: lambda {|attr| attr['name'].blank?}, allow_destroy: true
end
