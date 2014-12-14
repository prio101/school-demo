class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :full_name
      t.boolean :primary_contract_person
      t.string :phone_number
      t.string :email
      t.string :address
      t.integer :school_id
      t.integer :student_id
      t.integer :batch_id
      t.integer :classification_id

      t.timestamps
    end

    remove_column :students, :parent_id

    add_index :parents, :school_id
    add_index :parents, :student_id
    add_index :parents, :batch_id
    add_index :parents, :classification_id
  end
end
