json.array!(@course_timetables) do |course_timetable|
  json.extract! course_timetable, :id
  json.url course_timetable_url(course_timetable, format: :json)
end
