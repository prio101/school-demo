class SetDefaultValueOfNumberOfSmsAndActiveColumnInSmsAccount < ActiveRecord::Migration
  def change
    change_column :sms_accounts, :number_of_sms, :integer, default: 0
    change_column :sms_accounts, :active, :boolean, default: false
  end
end
