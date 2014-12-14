class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :amount
      t.string :transaction_type
      t.string :billable_type
      t.string :billable_id

      t.timestamps
    end
    add_index :transactions, :billable_id
  end
end
