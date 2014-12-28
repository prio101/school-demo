json.array!(@cards) do |card|
  json.extract! card, :id, :tag, :student_id
  json.url card_url(card, format: :json)
end
