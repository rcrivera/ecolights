class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

		def sanitize_data raw_data
			if raw_data.nil?
				return nil
			end
			raw_data = raw_data.strip
			data = raw_data.split(/\r\n/)
			clean_elements = Array.new
			data.each do |element|
				clean_elements.push(element.strip)
			end
			clean_elements = clean_elements.join("\r\n")
			return clean_elements
		end

		def sanitize_attributes raw_attributes
			if raw_attributes.nil?
				return nil
			end
			raw_attributes = raw_attributes.strip
			data = raw_attributes.split(/\t/)
			clean_elements = Array.new
			data.each do |element|
				element = element.strip
				clean_elements.push(element)
			end
			clean_elements = clean_elements.join("\r\n")
			return clean_elements
		end
end
