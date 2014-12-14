class AddFeeToFeeCategory < ActiveRecord::Migration
  def change
    add_column :fee_categories, :fee, :string
    add_index :fee_categories, :fee
  end
end
