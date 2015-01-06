class AddFullMarksToExam < ActiveRecord::Migration
  def change
    add_column :exams, :full_marks, :integer, :default => 40, null: false
  end
end
