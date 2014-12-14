class AddReferenceToStudentBalance < ActiveRecord::Migration
  def change
    add_column :student_balances, :reference, :string
  end
end
