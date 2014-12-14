class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.decimal :amount
      t.string :currency
      t.integer :school_id
      t.integer :batch_id
      t.string :classification_id

      t.timestamps
    end
    add_index :fees, :school_id
    add_index :fees, :batch_id
    add_index :fees, :classification_id
  end
end
