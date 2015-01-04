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
#

class Exam < ActiveRecord::Base
  belongs_to :batch
  has_many :results
end
