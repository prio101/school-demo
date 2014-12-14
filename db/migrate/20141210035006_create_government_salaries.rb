class CreateGovernmentSalaries < ActiveRecord::Migration
  def change
    create_table :government_salaries do |t|
      t.integer :teacher_id
      t.integer :bank_no
      t.integer :pay_scale_code
      t.integer :pay_scale_accomodation_medical
      t.integer :incrementt
      t.integer :total
      t.integer :welfare_reduction
      t.integer :retirement_reduction
      t.integer :total_reduction
      t.integer :total_received

      t.timestamps
    end
  end
end
