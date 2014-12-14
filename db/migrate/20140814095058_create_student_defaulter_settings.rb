class CreateStudentDefaulterSettings < ActiveRecord::Migration
  def change
    create_table :student_defaulter_settings do |t|
      t.string :amount
      t.boolean :current
      t.integer :student_id

      t.timestamps
    end
  end
end
