class CreateCourseTimetables < ActiveRecord::Migration
  def change
    create_table :course_timetables do |t|
      t.integer :course_id
      t.integer :subject_id
      t.integer :school_id
      t.integer :day
      t.time :start_time
      t.time :end_time
      t.boolean :active

      t.timestamps
    end
    add_index :course_timetables, :course_id
    add_index :course_timetables, :subject_id
    add_index :course_timetables, :school_id
  end
end
