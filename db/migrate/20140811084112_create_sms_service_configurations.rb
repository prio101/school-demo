class CreateSmsServiceConfigurations < ActiveRecord::Migration
  def change
    create_table :sms_service_configurations do |t|
      t.string :phone_number
      t.string :api_url

      t.timestamps
    end
  end
end
