Authorization.ignore_access_control(true)
batches = ["winter", 'fall', 'spring']

school = School.find_or_create_by(name: 'Test High School', code: 'test', domain: 'http://test.localhost.com')

if school

  ActsAsTenant.current_tenant = school
  ActsAsTenant.with_tenant(school) do

    batches.each do |brazil|
      Batch.create!([
                        {name: brazil.humanize, school_id: school.id}
                    ])

    end

    ['cse', 'ete', 'bba'].each do |i|
      Course.create!([
                         {name: i.humanize, code: Random.rand(Time.now.to_i), batch_id: Batch.all.sample.id, school_id: school.id}
                     ])
    end


    2.upto(5) do |i|
      Student.create!([
                          {first_name: Forgery::Name.first_name, middle_name: "", last_name: Forgery::Name.last_name, gender: "Male", date_of_birth: "06/05/1991", admission_number: "1-#{i}", contact_number: "+8801766678130", batch_id: Batch.all.sample.id, classification_id: Course.all.sample.id, course_id: Course.all.sample.id, course_section_id: CourseSection.all.sample.id
                          }
                      ])
    end
  end
else
  puts "No School Found"
end


