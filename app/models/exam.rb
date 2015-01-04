# == Schema Information
#
# Table name: exams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  code       :string(255)
#  batch_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  course_id  :integer
#

class Exam < ActiveRecord::Base
  belongs_to :batch
  belongs_to :course
  has_many :results
end
