class ChangeApiUrlToSmsApiUrlInSchool < ActiveRecord::Migration
  def change
    rename_column :schools, :api_url, :sms_api_url
  end
end
