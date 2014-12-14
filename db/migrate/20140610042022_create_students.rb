class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :school_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :date_of_birth
      t.string :admission_number
      t.string :contact_number
      t.integer :parent_id
      t.integer :batch_id
      t.integer :classification_id

      t.timestamps
    end
    add_index :students, :school_id
    add_index :students, :parent_id
    add_index :students, :batch_id
    add_index :students, :classification_id
  end
end
