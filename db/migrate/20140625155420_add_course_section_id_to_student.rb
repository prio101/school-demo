class AddCourseSectionIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :course_section_id, :integer
    add_index :students, :course_section_id
  end
end
