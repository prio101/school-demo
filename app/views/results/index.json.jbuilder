json.array!(@results) do |result|
  json.extract! result, :id, :exam_name, :code, :grade
  json.url result_url(result, format: :json)
end
