class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :name
      t.integer :school_id
      t.integer :batch_id

      t.timestamps
    end
    add_index :classifications, :school_id
    add_index :classifications, :batch_id
  end
end
