class AddSchoolYearToStudent < ActiveRecord::Migration
  def change
    add_column :students, :school_year, :string
  end
end
