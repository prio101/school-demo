class ChangeRecurrentDefaultValueToFalse < ActiveRecord::Migration
  def change
    change_column :fee_categories, :recurrent, :boolean, :default => false
  end
end
