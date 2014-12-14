class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :school_id
      t.integer :batch_id
      t.integer :course_id
      t.string :username
      t.string :role
      t.boolean :active

      t.timestamps
    end
    add_index :users, :school_id
    add_index :users, :batch_id
    add_index :users, :course_id
  end
end
