class Category < ActiveRecord::Base
	has_many :category_products
	has_many :products, :through => :category_products

	has_ancestry

	has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png",
		:url => "/assets/categories/:id/:style/:basename.:extension",
  		:path => ":rails_root/public/assets/categories/:id/:style/:basename.:extension"
end
