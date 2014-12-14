class SetDefaulterAmountDefault < ActiveRecord::Migration
  def change
    change_column :courses, :defaulter_amount, :integer, :default => 1000
  end
end
