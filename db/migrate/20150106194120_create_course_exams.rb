class CreateCourseExams < ActiveRecord::Migration
  def change
    create_table :course_exams do |t|
      t.references :course, index: true
      t.references :examiner, index: true
      t.timestamps
    end
  end
end
