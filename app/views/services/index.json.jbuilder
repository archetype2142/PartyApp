json.array!(@services) do |service|
  json.extract! service, :id, :service_name, :description, :price, :location
  json.url service_url(service, format: :json)
end
