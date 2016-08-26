json.array!(@projectrequirements) do |projectrequirement|
  json.extract! projectrequirement, :id, :level, :experience, :domain, :desgination_id, :primary_technology, :secondary_technology, :location_id, :integer, :sublocation_id
  json.url projectrequirement_url(projectrequirement, format: :json)
end
