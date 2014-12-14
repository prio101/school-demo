class AddCourseIdIndexToTables < ActiveRecord::Migration
  def change
    add_column :students, :course_id, :integer
    add_column :parents, :course_id, :integer
    add_column :fees, :course_id, :integer
    add_column :fee_collection_schedules, :course_id, :integer

    add_index :students, :course_id
    add_index :parents, :course_id
    add_index :fees, :course_id
    add_index :fee_collection_schedules, :course_id
  end
end
