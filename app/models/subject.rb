# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Subject < ActiveRecord::Base
  has_many :student_subjects
  has_many :students, through: :student_subjects
  has_many :examiners
  has_many :exam_schedules, :through => :examiners
  has_many :examiner_teacher, through: :examiners, :class_name => 'Teacher'
end
