class Download < ActiveRecord::Base
	belongs_to :product

	has_attached_file :pdf,
    :url => "/assets/downloads/:id/:basename.:extension",
  	:path => ":rails_root/public/assets/downloads/:id/:basename.:extension"
end
