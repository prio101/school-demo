json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :position, :exam_group_id
  json.url exam_url(exam, format: :json)
end
