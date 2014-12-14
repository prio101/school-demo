class AddDefaulterAmmountToStudentBalance < ActiveRecord::Migration
  def change
    add_column :student_balances, :defaulter_amount, :string
  end
end
