class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :details
      t.string :banner
      t.string :logo
      t.boolean :active
      t.string :code
      t.string :domain

      t.timestamps
    end
  end
end
