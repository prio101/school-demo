# == Schema Information
#
# Table name: course_timetables
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  subject_id :integer
#  school_id  :integer
#  day        :integer
#  start_time :time
#  end_time   :time
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_course_timetables_on_course_id   (course_id)
#  index_course_timetables_on_school_id   (school_id)
#  index_course_timetables_on_subject_id  (subject_id)
#

class CourseTimetable < ActiveRecord::Base
end
