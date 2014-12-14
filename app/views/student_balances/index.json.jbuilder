json.array!(@student_balances) do |student_balance|
  json.extract! student_balance, :id
  json.url student_balance_url(student_balance, format: :json)
end
