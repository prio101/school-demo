class RemoveFeeCollectionScheduleDFeeCategory < ActiveRecord::Migration
  def change
    remove_column :fee_categories, :fee_collection_schedule_d
    remove_column :fee_categories, :admin_id
    add_column :fee_categories, :school_id, :integer
    add_index :fee_categories, :school_id
  end
end
