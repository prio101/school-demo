class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.string :code
      t.integer :school_id

      t.timestamps
    end
    add_index :batches, :school_id
  end
end
