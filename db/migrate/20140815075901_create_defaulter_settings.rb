class CreateDefaulterSettings < ActiveRecord::Migration
  def change
    create_table :defaulter_settings do |t|
      t.string :name
      t.string :amount
      t.integer :batch_id
      t.boolean :current

      t.timestamps
    end
  end
end
