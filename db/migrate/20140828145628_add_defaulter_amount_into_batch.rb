class AddDefaulterAmountIntoBatch < ActiveRecord::Migration
  def change
    add_column :batches, :defaulter_amount, :string
  end
end
