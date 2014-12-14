class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :fee_id
      t.integer :school_id
      t.string :title
      t.integer :state
      t.integer :user_id
      t.date :voided_at
      t.datetime :paid_at
      t.date :due_at
      t.string :course_id
      t.integer :batch_id
      t.string :amount
      t.string :invoice_number

      t.timestamps
    end
    add_index :invoices, :fee_id
    add_index :invoices, :school_id
    add_index :invoices, :user_id
    add_index :invoices, :course_id
    add_index :invoices, :batch_id
  end
end
