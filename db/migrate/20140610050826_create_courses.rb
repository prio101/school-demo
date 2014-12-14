class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :school_id
      t.string :batch_id

      t.timestamps
    end
    add_index :courses, :school_id
    add_index :courses, :batch_id
  end
end
