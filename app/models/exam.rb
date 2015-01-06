# == Schema Information
#
# Table name: exams
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  position      :integer
#  exam_group_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#  full_marks    :integer          default(40), not null
#
# Indexes
#
#  index_exams_on_exam_group_id  (exam_group_id)
#  index_exams_on_position       (position)
#

class Exam < ActiveRecord::Base

  belongs_to :exam_group
  has_many :exam_schedules


  acts_as_list scope: :exam_group

  validates :name, :full_marks, presence: true

end
