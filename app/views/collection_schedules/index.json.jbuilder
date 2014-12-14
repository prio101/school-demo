json.array!(@collection_schedules) do |collection_schedule|
  json.extract! collection_schedule, :id, :fee_category_id, :name, :starting_time, :ending_time, :school_id, :create_due_invoice, :due_date
  json.url collection_schedule_url(collection_schedule, format: :json)
end
