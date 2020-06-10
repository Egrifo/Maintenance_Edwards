class Verification < ApplicationRecord
  belongs_to :maintenance#,:destroy,#:nullify, dependent: :delete_all
  belongs_to :task
  has_many :transactions
  scope :traceable, -> { where.not(signoff:  nil) }
 
end
