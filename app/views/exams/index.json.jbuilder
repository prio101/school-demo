json.array!(@exams) do |exam|
  json.extract! exam, :id, :name, :code, :batch_id
  json.url exam_url(exam, format: :json)
end
