class AddUserIdAndRecurrentAndFeeCollectionScheduleId < ActiveRecord::Migration
  def change
    add_column :fee_categories, :user_id, :integer
    add_column :fee_categories, :fee_collection_schedule_d, :integer
    add_column :fee_categories, :recurrent, :boolean
  end
end
