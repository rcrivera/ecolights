class Contact
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

	attr_accessor :name, :email, :phone, :contact_time, :message

	validates_presence_of :name, :email, :message
 	validates_format_of :email, :with => /\A[^@]+@[^@]+\z/
	validates_length_of :message, :maximum => 500

	def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
