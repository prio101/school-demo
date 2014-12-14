class CreateStudentSubjects < ActiveRecord::Migration
  def change
    create_table :student_subjects do |t|
      t.integer :student_id
      t.integer :subject_id

      t.timestamps
    end
    add_index :student_subjects, :student_id
    add_index :student_subjects, :subject_id
  end
end
