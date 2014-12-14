class CreateCourseSections < ActiveRecord::Migration
  def change
    create_table :course_sections do |t|
      t.integer :school_id
      t.string :section_name
      t.integer :course_id
      t.integer :batch_id

      t.timestamps
    end
    add_index :course_sections, :school_id
    add_index :course_sections, :course_id
    add_index :course_sections, :batch_id
  end
end
