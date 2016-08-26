json.array!(@sublocations) do |sublocation|
  json.extract! sublocation, :id, :name, :location_id
  json.url sublocation_url(sublocation, format: :json)
end
