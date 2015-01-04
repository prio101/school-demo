# == Schema Information
#
# Table name: courses
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  school_id        :integer
#  batch_id         :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  code             :string(255)
#  defaulter_amount :integer          default(1000)
#
# Indexes
#
#  index_courses_on_batch_id   (batch_id)
#  index_courses_on_code       (code)
#  index_courses_on_school_id  (school_id)
#

class Course < ActiveRecord::Base

  paginates_per 10

  #using_access_control

  has_many :students
  has_many :course_sections
  has_many :invoices
  has_many :exams

  belongs_to :batch
  belongs_to :school

  validates :school_id, :batch_id, :name, :presence => true 
  validates :code, presence: true, uniqueness: true

  after_create :create_default_section

  acts_as_tenant(:school)

  before_destroy :check_if_students_available

  def student_count
    if self.students.count > 0
      true
    end
  end

  private

  def create_default_section
    self.course_sections.create!(section_name: 'Default Section', batch_id: self.batch_id, code: "#{Random.rand(Time.now.to_i)}")
  end

  def check_if_students_available
    if self.students.count > 0
      errors.add(:student_available, "This course has #{self.students.count} student(s)")
      false
    end
  end


end
