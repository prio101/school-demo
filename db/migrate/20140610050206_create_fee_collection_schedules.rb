class CreateFeeCollectionSchedules < ActiveRecord::Migration
  def change
    create_table :fee_collection_schedules do |t|
      t.string :name
      t.string :school_id
      t.text :schedule

      t.timestamps
    end
    add_index :fee_collection_schedules, :school_id
  end
end
