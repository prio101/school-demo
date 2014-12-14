# == Schema Information
#
# Table name: batches
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  school_id            :integer
#  created_at           :datetime
#  updated_at           :datetime
#  defaulter_setting_id :integer
#  defaulter_amount     :integer          default(2000)
#
# Indexes
#
#  index_batches_on_school_id  (school_id)
#

class Batch < ActiveRecord::Base

  paginates_per 10

  using_access_control

  has_many :courses
  has_many :students
  has_many :parents
  has_many :course_sections, through: :courses
  has_many :invoices

  belongs_to :school

  validates :name, :school_id, :presence => true

  before_destroy :check_if_students_available

  acts_as_tenant(:school)

  def check_if_students_available
    if self.students.count > 0
      errors.add(:student_available, "This batch has #{self.students.count} student(s)")
      false
    end
  end


end
