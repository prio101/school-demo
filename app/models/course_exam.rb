# == Schema Information
#
# Table name: course_exams
#
#  id          :integer          not null, primary key
#  course_id   :integer
#  examiner_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_course_exams_on_course_id    (course_id)
#  index_course_exams_on_examiner_id  (examiner_id)
#

class CourseExam < ActiveRecord::Base
  belongs_to :examiner
  belongs_to :course
end
