class AddDefaulterAmountToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :defaulter_amount, :integer
  end
end
