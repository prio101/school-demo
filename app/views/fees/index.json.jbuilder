json.array!(@fees) do |fee|
  json.extract! fee, :id
  json.url fee_url(fee, format: :json)
end
