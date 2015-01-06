json.array!(@exam_groups) do |exam_group|
  json.extract! exam_group, :id, :name
  json.url exam_group_url(exam_group, format: :json)
end
