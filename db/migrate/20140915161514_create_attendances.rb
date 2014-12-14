class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :school_id
      t.integer :student_id
      t.boolean :active
      t.string :notes
      t.integer :course_id
      t.integer :course_section_id
      t.integer :batch_id
      t.boolean :attended

      t.timestamps
    end
    add_index :attendances, :school_id
    add_index :attendances, :course_id
    add_index :attendances, :course_section_id
    add_index :attendances, :batch_id
  end
end
