class Approval < ActiveRecord::Base
	has_many :product_approvals
	has_many :products, :through => :product_approvals

  has_attached_file :picture, :dependent => :destroy, :styles => { :thumb => "60x60>" }, 
  	:default_url => "/images/:style/missing.png",
	:url => "/assets/approvals/:id/:style/:basename.:extension",
  	:path => ":rails_root/public/assets/approvals/:id/:style/:basename.:extension"
end
