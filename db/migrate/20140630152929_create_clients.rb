class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_key

      t.timestamps
    end
    add_index :clients, :client_key
  end
end
