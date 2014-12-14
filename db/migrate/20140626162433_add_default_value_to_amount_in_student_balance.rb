class AddDefaultValueToAmountInStudentBalance < ActiveRecord::Migration
  def change
    change_column :student_balances, :amount, :integer, :default => 0
    change_column :collection_schedules, :starting_time, :string, :default => Date.today, null: false
    add_column :collection_schedules, :active, :boolean, :default => true
  end
end
