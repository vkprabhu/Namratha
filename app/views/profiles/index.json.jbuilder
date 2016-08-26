json.array!(@profiles) do |profile|
  json.extract! profile, :id, :employeeid, :DOB, :first_name, :last_name, :phone_number, :level, :previous_manager, :current_manager, :experience, :domain, :hr, :sublocation_id, :primary_technology, :secondary_technology, :designation_id, :user_id
  json.url profile_url(profile, format: :json)
end
