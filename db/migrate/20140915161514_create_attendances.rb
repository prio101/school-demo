class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :date
      t.string :weekday
      t.integer :student_id

      t.timestamps
    end
  end
end
