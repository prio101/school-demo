class MakeSchoolIdAsIndexInSmsAccount < ActiveRecord::Migration
  def change
    add_index :sms_accounts, :school_id, :unique => true
  end
end
