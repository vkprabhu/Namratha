json.array!(@desginations) do |desgination|
  json.extract! desgination, :id, :name
  json.url desgination_url(desgination, format: :json)
end
