class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.integer :client_id
      t.string :access_token

      t.timestamps
    end
    add_index :api_keys, :client_id
  end
end
