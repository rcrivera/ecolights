class ProductApproval < ActiveRecord::Base
	belongs_to :product
	belongs_to :approval
end
