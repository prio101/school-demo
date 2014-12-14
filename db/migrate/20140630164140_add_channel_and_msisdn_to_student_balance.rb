class AddChannelAndMsisdnToStudentBalance < ActiveRecord::Migration
  def change
    add_column :student_balances, :channel, :string
    add_column :student_balances, :msisdn, :string
  end
end
