module ApplicationHelper
	def link_to_add_models(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    models = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_models btn btn-success", data: {id: id, models: models.gsub("\n", "")})
  end

  def link_to_add_downloads(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    models = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_models btn btn-success", data: {id: id, models: models.gsub("\n", "")})
  end


	def split_data data
		return data.split(/\r\n/)
	end

  def split_spec spec
    return spec.split(':')
  end

end
