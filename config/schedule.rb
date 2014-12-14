job_type :command, ":task :output"
job_type :rake, "cd :path && RAILS_ENV=production bundle exec rake :task --silent :output"


every :day, :at => '12:20am' do
  rake "payments:collect", :environment => 'development'
end

