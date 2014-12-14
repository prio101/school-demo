class AddDueToStudentBalance < ActiveRecord::Migration
  def change
    add_column :student_balances, :due, :boolean, default: true
  end
end
