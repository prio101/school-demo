class CreateMarksSubmissions < ActiveRecord::Migration
  def change
    create_table :marks_submissions do |t|
      t.decimal :obtained_marks
      t.string :exam_marks
      t.string :grace
      t.references :course_exam, :index => true
      t.references :student, :index => true
      t.references :course_section, :index => true

      t.timestamps
    end
  end
end
