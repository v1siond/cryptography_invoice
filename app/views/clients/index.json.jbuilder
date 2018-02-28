json.array!(@clients) do |client|
  json.name                 client.name
  json.identification       client.identification
  json.id                   client.id
end