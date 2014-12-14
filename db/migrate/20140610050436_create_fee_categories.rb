class CreateFeeCategories < ActiveRecord::Migration
  def change
    create_table :fee_categories do |t|
      t.string :name
      t.string :admin_id

      t.timestamps
    end
    add_index :fee_categories, :admin_id
  end
end
