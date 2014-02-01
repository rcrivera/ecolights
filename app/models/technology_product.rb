class TechnologyProduct < ActiveRecord::Base
	belongs_to :technology
	belongs_to :product
end
