# == Schema Information
#
# Table name: examiners
#
#  id               :integer          not null, primary key
#  exam_schedule_id :integer
#  teacher_id       :integer
#  subject_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Examiner < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject
  belongs_to :exam_schedule

  has_many :course_exams
  has_many :courses, through: :course_exams



end
