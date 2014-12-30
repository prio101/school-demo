class AddWeekdayToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :weekday, :string
  end
end
