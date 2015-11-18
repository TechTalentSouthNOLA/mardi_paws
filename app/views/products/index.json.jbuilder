json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :current_price, :quantity, :category_id, :brand_id
  json.url product_url(product, format: :json)
end
