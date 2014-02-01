class Product < ActiveRecord::Base
	has_many :category_products
	has_many :categories, :through => :category_products

	has_many :product_approvals
	has_many :approvals, :through => :product_approvals

	has_many :models, :dependent => :destroy

	has_many :technology_products
	has_many :technologies, :through => :technology_products

	has_one :featured_product, :dependent => :destroy

	has_many :downloads, :dependent => :destroy

	accepts_nested_attributes_for :models, allow_destroy: true

	accepts_nested_attributes_for :downloads, allow_destroy: true

	accepts_nested_attributes_for :categories

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png",
		:url => "/assets/products/:id/:style/:basename.:extension",
  		:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
end
