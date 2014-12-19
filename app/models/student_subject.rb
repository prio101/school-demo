# == Schema Information
#
# Table name: student_subjects
#
#  id         :integer          not null, primary key
#  subject_id :integer
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class StudentSubject < ActiveRecord::Base
  belongs_to :student
  belongs_to :subject
end
