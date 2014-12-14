class AddSchoolIdAndUserIdToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :user_id, :string
    add_index :transactions, :user_id
    add_column :transactions, :school_id, :string
    add_index :transactions, :school_id
    change_column :transactions, :billable_id, :integer
  end
end
