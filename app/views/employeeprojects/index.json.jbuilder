json.array!(@employeeprojects) do |employeeproject|
  json.extract! employeeproject, :id, :start_date, :end_date, :domain, :user_id
  json.url employeeproject_url(employeeproject, format: :json)
end
