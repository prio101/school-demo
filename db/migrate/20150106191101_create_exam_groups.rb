class CreateExamGroups < ActiveRecord::Migration
  def change
    create_table :exam_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
