json.array!(@featured_products) do |featured_product|
  json.extract! featured_product, :id, :product_id, :message
  json.url featured_product_url(featured_product, format: :json)
end
