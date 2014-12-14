json.array!(@defaulter_settings) do |defaulter_setting|
  json.extract! defaulter_setting, :id, :name, :amount, :batch_id, :current
  json.url defaulter_setting_url(defaulter_setting, format: :json)
end
