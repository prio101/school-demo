class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :school_id
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    add_index :roles, :school_id
    add_index :roles, :user_id
  end
end
