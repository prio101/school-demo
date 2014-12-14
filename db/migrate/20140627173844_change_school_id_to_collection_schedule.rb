class ChangeSchoolIdToCollectionSchedule < ActiveRecord::Migration
  def change
    change_column :collection_schedules, :school_id, :integer
  end
end
