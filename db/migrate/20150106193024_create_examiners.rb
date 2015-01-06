class CreateExaminers < ActiveRecord::Migration
  def change
    create_table :examiners do |t|
      t.references :exam_schedule
      t.references :teacher
      t.references :subject
      t.timestamps
    end
  end
end

