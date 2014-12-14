CollectFee = Struct.new(:school_id, :collection_schedule_id) do


  def perform
    @school = School.find(school_id)
    @collection_schedule = CollectionSchedule.find(collection_schedule_id)
    Authorization.ignore_access_control(true)
    ActsAsTenant.with_tenant(@school) do
      collection_schedule = @collection_schedule
      collection_schedule.students.each do |student|
        student.student_balances
        .create(amount: collection_schedule.fee_category.fee, reference: collection_schedule.fee_category.name)
      end
    end
    Authorization.ignore_access_control(false)
  end

  def max_attempts
    return 1
  end

end
