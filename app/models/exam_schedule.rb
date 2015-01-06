# == Schema Information
#
# Table name: exam_schedules
#
#  id            :integer          not null, primary key
#  course_id     :integer
#  starting_date :datetime
#  ending_date   :datetime
#  comment       :text
#  active        :integer
#  created_at    :datetime
#  updated_at    :datetime
#  exam_id       :integer
#
# Indexes
#
#  index_exam_schedules_on_active     (active)
#  index_exam_schedules_on_course_id  (course_id)
#  index_exam_schedules_on_exam_id    (exam_id)
#

class ExamSchedule < ActiveRecord::Base
  belongs_to :exam
  has_many :examiners
  has_many :teachers, :through => :examiners
  has_many :subjects, :through => :examiners
end
