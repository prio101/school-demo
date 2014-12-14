class RemoveCodeFromBatch < ActiveRecord::Migration
  def change
    remove_column :batches, :code, :string
  end
end
