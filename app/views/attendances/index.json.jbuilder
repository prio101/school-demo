json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :date, :weekday, :student_id
  json.url attendance_url(attendance, format: :json)
end
