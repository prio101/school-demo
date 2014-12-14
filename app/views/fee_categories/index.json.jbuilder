json.array!(@fee_categories) do |fee_category|
  json.extract! fee_category, :id
  json.url fee_category_url(fee_category, format: :json)
end
