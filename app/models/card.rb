# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Card < ActiveRecord::Base
  has_one :student


  scope :unassigned, -> {includes(:student).where('students.id IS ?', nil)}
end
