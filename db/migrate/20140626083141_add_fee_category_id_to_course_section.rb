class AddFeeCategoryIdToCourseSection < ActiveRecord::Migration
  def change
    add_column :course_sections, :fee_category_id, :integer
    add_index :course_sections, :fee_category_id
  end
end
