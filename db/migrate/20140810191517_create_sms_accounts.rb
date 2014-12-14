class CreateSmsAccounts < ActiveRecord::Migration
  def change
    create_table :sms_accounts do |t|
      t.integer :school_id
      t.integer :number_of_sms
      t.boolean :active

      t.timestamps
    end
  end
end
