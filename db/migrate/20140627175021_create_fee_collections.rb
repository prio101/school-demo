class CreateFeeCollections < ActiveRecord::Migration
  def change
    create_table :fee_collections do |t|
      t.boolean :due, :default => true
      t.integer :fee_category_id
      t.integer :school_id
      t.integer :student_id
      t.timestamps
    end
    add_index :fee_collections, :school_id
    add_index :fee_collections, :student_id
    add_index :fee_collections, :fee_category_id
  end
end
