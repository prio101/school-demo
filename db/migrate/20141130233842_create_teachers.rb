class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :serial
      t.string :name
      t.date :date_of_birth
      t.text :educational_background
      t.date :date_of_joining
      t.string :designation
      t.date :date_of_MPO
      t.string :salary_scale_and_grade
      t.string :index_number
      t.string :mobile
      t.string :email
      t.string :part_time_or_full_time
      t.string :course_wise_department

      t.timestamps
    end
  end
end
