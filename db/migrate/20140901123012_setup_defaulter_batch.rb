class SetupDefaulterBatch < ActiveRecord::Migration
  def change
    change_column :batches, :defaulter_amount, :integer, :default => 2000
  end
end
