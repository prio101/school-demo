json.array!(@student_subjects) do |student_subject|
  json.extract! student_subject, :id
  json.url student_subject_url(student_subject, format: :json)
end
