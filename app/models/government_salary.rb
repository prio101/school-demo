# == Schema Information
#
# Table name: government_salaries
#
#  id                             :integer          not null, primary key
#  teacher_id                     :integer
#  bank_no                        :integer
#  pay_scale_code                 :integer
#  pay_scale_accomodation_medical :integer
#  incrementt                     :integer
#  total                          :integer
#  welfare_reduction              :integer
#  retirement_reduction           :integer
#  total_reduction                :integer
#  total_received                 :integer
#  created_at                     :datetime
#  updated_at                     :datetime
#

class GovernmentSalary < ActiveRecord::Base
  belongs_to :teacher
end
