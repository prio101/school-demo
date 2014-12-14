# == Schema Information
#
# Table name: teachers
#
#  id                     :integer          not null, primary key
#  serial                 :string(255)
#  name                   :string(255)
#  date_of_birth          :date
#  educational_background :text
#  date_of_joining        :date
#  designation            :string(255)
#  date_of_MPO            :date
#  salary_scale_and_grade :string(255)
#  index_number           :string(255)
#  mobile                 :string(255)
#  email                  :string(255)
#  part_time_or_full_time :string(255)
#  course_wise_department :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  department_id          :integer
#

class Teacher < ActiveRecord::Base
  belongs_to :department
  has_one :GovernmentSalary

  validates :serial, :name, :date_of_birth, :designation, :date_of_joining, :date_of_MPO, :salary_scale_and_grade, :index_number, :mobile, :email, :part_time_or_full_time,
            :course_wise_department, :course_wise_department, presence: true
  validates :index_number, uniqueness: true
end
