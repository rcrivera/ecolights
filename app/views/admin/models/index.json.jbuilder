json.array!(@models) do |model|
  json.extract! model, :id, :product_id, :sku_code, :characteristics
  json.url model_url(model, format: :json)
end
