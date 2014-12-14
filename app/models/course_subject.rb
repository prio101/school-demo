# == Schema Information
#
# Table name: course_subjects
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  subject_id :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_course_subjects_on_course_id   (course_id)
#  index_course_subjects_on_subject_id  (subject_id)
#

class CourseSubject < ActiveRecord::Base
end
