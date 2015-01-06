json.array!(@exam_schedules) do |exam_schedule|
  json.extract! exam_schedule, :id, :course_id, :teacher_id, :starting_date, :ending_date, :comment, :active
  json.url exam_schedule_url(exam_schedule, format: :json)
end
