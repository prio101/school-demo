class AddStudentIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :student_id, :integer
  end
end
