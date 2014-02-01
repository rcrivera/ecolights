json.array!(@technologies) do |technology|
  json.extract! technology, :id, :title, :description
  json.url technology_url(technology, format: :json)
end
