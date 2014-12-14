class SetCreateInvoiceDueToTrueByDefault < ActiveRecord::Migration
  def change
    change_column :collection_schedules, :create_due_invoice, :boolean, :default => true
  end
end
