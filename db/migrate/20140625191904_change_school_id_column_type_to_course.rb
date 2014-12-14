class ChangeSchoolIdColumnTypeToCourse < ActiveRecord::Migration
  def change
    change_column :courses, :school_id, :integer
  end
end
