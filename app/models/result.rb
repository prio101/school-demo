# == Schema Information
#
# Table name: results
#
#  id              :integer          not null, primary key
#  exam_name       :string(255)
#  code            :string(255)
#  grade           :float
#  created_at      :datetime
#  updated_at      :datetime
#  student_id      :integer
#  subject_id      :integer
#  subjective_mark :integer
#  objective_mark  :integer
#  exam_id         :integer
#

class Result < ActiveRecord::Base

  belongs_to :student
  belongs_to :exam
  belongs_to :subject

end
