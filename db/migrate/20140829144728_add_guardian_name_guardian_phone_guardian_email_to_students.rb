class AddGuardianNameGuardianPhoneGuardianEmailToStudents < ActiveRecord::Migration
  def change
    add_column :students, :guardian_name, :string
    add_column :students, :guardian_phone, :string
    add_column :students, :guardian_email, :string
  end
end
