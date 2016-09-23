json.array!(@delivers) do |deliver|
  json.extract! deliver, :id, :date_of_release, :profile_id
  json.url deliver_url(deliver, format: :json)
end
