class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :position
      t.integer :exam_group_id

      t.timestamps
    end
    add_index :exams, :position
    add_index :exams, :exam_group_id
  end
end
