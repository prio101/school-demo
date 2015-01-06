# == Schema Information
#
# Table name: marks_submissions
#
#  id                :integer          not null, primary key
#  obtained_marks    :integer
#  exam_marks        :string(255)
#  grace             :string(255)
#  course_exam_id    :integer
#  student_id        :integer
#  course_section_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_marks_submissions_on_course_exam_id     (course_exam_id)
#  index_marks_submissions_on_course_section_id  (course_section_id)
#  index_marks_submissions_on_student_id         (student_id)
#

class MarksSubmission < ActiveRecord::Base
  belongs_to :student
  belongs_to :course_section
  belongs_to :course_exam
end
