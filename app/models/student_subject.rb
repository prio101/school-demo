# == Schema Information
#
# Table name: student_subjects
#
#  id         :integer          not null, primary key
#  student_id :integer
#  subject_id :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_student_subjects_on_student_id  (student_id)
#  index_student_subjects_on_subject_id  (subject_id)
#

class StudentSubject < ActiveRecord::Base
end
