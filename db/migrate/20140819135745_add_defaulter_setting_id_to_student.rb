class AddDefaulterSettingIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :defaulter_setting_id, :integer
    add_index :students, :defaulter_setting_id
  end
end
