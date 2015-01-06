class RenameTeacherIdByExamIdToExamSchedule < ActiveRecord::Migration
  def change
    remove_index :exam_schedules, :teacher_id
    remove_column :exam_schedules, :teacher_id
    add_reference :exam_schedules, :exam, index: true
  end
end
