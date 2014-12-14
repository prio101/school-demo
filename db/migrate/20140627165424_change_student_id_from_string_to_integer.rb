class ChangeStudentIdFromStringToInteger < ActiveRecord::Migration
  def change
    change_column :student_balances, :school_id, :integer, null: false
  end
end
