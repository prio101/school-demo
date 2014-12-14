# == Schema Information
#
# Table name: course_sections
#
#  id              :integer          not null, primary key
#  school_id       :integer
#  section_name    :string(255)
#  course_id       :integer
#  batch_id        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  fee_category_id :integer
#  code            :string(255)
#
# Indexes
#
#  index_course_sections_on_batch_id         (batch_id)
#  index_course_sections_on_code             (code)
#  index_course_sections_on_course_id        (course_id)
#  index_course_sections_on_fee_category_id  (fee_category_id)
#  index_course_sections_on_school_id        (school_id)
#

class CourseSection < ActiveRecord::Base

  paginates_per 10

  validates :school_id, presence: true
  validates :section_name, presence: true
  validates :course_id, presence: true
  validates :batch_id, presence: true
  validates :code, presence: true, uniqueness: true

  acts_as_tenant(:school)

  has_many :students
  belongs_to :school
  belongs_to :course
  belongs_to :batch

  before_destroy :check_if_students_available
  #before_validation :append_code_if_not_present

  def append_code_if_not_present
    self.code = self.section_name.downcase.gsub(/\s+/, '_') if !self.code.present?
  end

  def student_count
    if self.students.count > 0
      true
    end
  end

  def display_name
    [course.try(:name), section_name].join("-")
  end

  def check_if_students_available
    if self.students.count > 0
      errors.add(:student_available, "This section has #{self.students.count} student(s)")
      false
    end
  end

end
