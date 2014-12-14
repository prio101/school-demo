class AddTransactionIdToStudentBalance < ActiveRecord::Migration
  def change
    add_column :student_balances, :transaction_id, :integer
    add_index :student_balances, :transaction_id, unique: true
  end
end
