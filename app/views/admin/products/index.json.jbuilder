json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :sku_code, :specifications, :features
  json.url product_url(product, format: :json)
end
