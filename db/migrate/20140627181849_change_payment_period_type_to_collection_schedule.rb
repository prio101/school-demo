class ChangePaymentPeriodTypeToCollectionSchedule < ActiveRecord::Migration
  def change
    change_column :collection_schedules, :payment_period, :integer, :default => 0
  end
end
