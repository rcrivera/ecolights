class Technology < ActiveRecord::Base
	has_many :technology_products
	has_many :products, :through => :technology_products

	has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png",
		:url => "/assets/technologies/:id/:style/:basename.:extension",
  		:path => ":rails_root/public/assets/technologies/:id/:style/:basename.:extension"
end
