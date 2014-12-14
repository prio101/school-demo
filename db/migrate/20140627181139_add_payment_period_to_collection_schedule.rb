class AddPaymentPeriodToCollectionSchedule < ActiveRecord::Migration
  def change
    add_column :collection_schedules, :payment_period, :string
  end
end
