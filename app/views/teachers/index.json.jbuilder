json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :serial, :name, :date_of_birth, :educational_background, :date_of_joining, :designation, :date_of_MPO, :salary_scale_and_grade, :index_number, :mobile, :email, :part_time_or_full_time, :course_wise_department
  json.url teacher_url(teacher, format: :json)
end
