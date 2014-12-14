class AddCodeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :code, :string
    add_index :courses, :code
    add_column :course_sections, :code, :string
    add_index :course_sections, :code
  end
end
