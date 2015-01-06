# == Schema Information
#
# Table name: exam_groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ExamGroup < ActiveRecord::Base
  has_many :exams, -> { order("position ASC") }
end
