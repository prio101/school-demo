class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.string :code
      t.integer :batch_id

      t.timestamps
    end
  end
end
