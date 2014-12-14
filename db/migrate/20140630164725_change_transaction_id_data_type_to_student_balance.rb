class ChangeTransactionIdDataTypeToStudentBalance < ActiveRecord::Migration
  def change
    change_column :student_balances, :transaction_id, :string
  end
end
