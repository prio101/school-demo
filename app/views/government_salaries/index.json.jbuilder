json.array!(@government_salaries) do |government_salary|
  json.extract! government_salary, :id, :bank_no, :pay_scale_code, :pay_scale_accomodation_medical, :incrementt, :total, :welfare_reduction, :retirement_reduction, :total_reduction, :total_received
  json.url government_salary_url(government_salary, format: :json)
end
