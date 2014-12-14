class CreateStudentBalances < ActiveRecord::Migration
  def change
    create_table :student_balances do |t|
      t.integer :amount
      t.string :school_id
      t.string :student_id

      t.timestamps
    end
    add_index :student_balances, :school_id
    add_index :student_balances, :student_id
  end
end
