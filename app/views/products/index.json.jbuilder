json.array!(@product) do |product|
  json.id           product.id
  json.name         product.name
  json.price        product.price
end