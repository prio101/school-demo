class CreateCollectionSchedules < ActiveRecord::Migration
  def change
    create_table :collection_schedules do |t|
      t.string :fee_category_id
      t.string :name
      t.string :starting_time
      t.string :ending_time
      t.string :school_id
      t.boolean :create_due_invoice
      t.date :due_date

      t.timestamps
    end
    add_index :collection_schedules, :fee_category_id
    add_index :collection_schedules, :school_id
  end
end
