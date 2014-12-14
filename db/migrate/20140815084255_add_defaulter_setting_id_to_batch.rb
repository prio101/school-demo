class AddDefaulterSettingIdToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :defaulter_setting_id, :integer
  end
end
