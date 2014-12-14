class AddToBeAuthenticatedTypeAndToBeAuthenticatedIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :to_be_authenticated_id, :integer
    add_index :users, :to_be_authenticated_id
    add_column :users, :to_be_authenticated_type, :string
  end
end
