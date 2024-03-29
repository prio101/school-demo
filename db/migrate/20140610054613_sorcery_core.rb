class SorceryCore < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

    end

    add_index :users, :email, unique: true
  end
end