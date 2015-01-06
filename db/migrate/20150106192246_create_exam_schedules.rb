class CreateExamSchedules < ActiveRecord::Migration
  def change
    create_table :exam_schedules do |t|
      t.integer :course_id
      t.integer :teacher_id
      t.datetime :starting_date
      t.datetime :ending_date
      t.text :comment
      t.integer :active

      t.timestamps
    end
    add_index :exam_schedules, :course_id
    add_index :exam_schedules, :teacher_id
    add_index :exam_schedules, :active
  end
end
