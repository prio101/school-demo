namespace :payments do
  desc "Check and assign fees to student"
  task :collect => :environment do
    School.all.each do |school|
      ActsAsTenant.with_tenant(school) do
        CollectionSchedule.all.each do |collection_schedule|
          if collection_schedule.events.include?(Date.today)
            Delayed::Job.enqueue CollectFee.new(school.id, collection_schedule.id)
          end
        end
      end
    end
  end
end
