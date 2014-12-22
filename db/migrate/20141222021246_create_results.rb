class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :exam_name
      t.string :code
      t.float :grade

      t.timestamps
    end
  end
end
