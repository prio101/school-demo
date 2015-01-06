# == Schema Information
#
# Table name: course_teachers
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  teacher_id :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_course_teachers_on_course_id   (course_id)
#  index_course_teachers_on_teacher_id  (teacher_id)
#

class CourseTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :course
end
