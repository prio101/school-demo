# == Schema Information
#
# Table name: students
#
#  id                   :integer          not null, primary key
#  school_id            :integer
#  first_name           :string(255)
#  middle_name          :string(255)
#  last_name            :string(255)
#  gender               :string(255)
#  date_of_birth        :string(255)
#  admission_number     :string(255)
#  contact_number       :string(255)
#  batch_id             :integer
#  classification_id    :integer
#  created_at           :datetime
#  updated_at           :datetime
#  course_id            :integer
#  course_section_id    :integer
#  defaulter_setting_id :integer
#  guardian_name        :string(255)
#  guardian_phone       :string(255)
#  guardian_email       :string(255)
#  school_year          :string(255)
#  avatar               :string(255)
#
# Indexes
#
#  index_students_on_batch_id              (batch_id)
#  index_students_on_classification_id     (classification_id)
#  index_students_on_course_id             (course_id)
#  index_students_on_course_section_id     (course_section_id)
#  index_students_on_defaulter_setting_id  (defaulter_setting_id)
#  index_students_on_school_id             (school_id)
#

class Student < ActiveRecord::Base

  require 'carrierwave/orm/activerecord'

  protokoll :admission_number, :pattern => "1########"

  paginates_per 10

  include Students::Constants
  acts_as_tenant(:school)
  using_access_control

  has_one :user, dependent: :delete

  belongs_to :batch
  belongs_to :course
  belongs_to :school
  belongs_to :course_section
  has_many :results


  has_many :student_balances
  has_many :invoices
  has_many :parents
  has_many :cards
  has_many :attendances


  has_many :student_subjects
  has_many :subjects, through: :student_subjects

  accepts_nested_attributes_for :parents


  validates :admission_number, :uniqueness => true
  validates :school_id, :first_name,
            :last_name, :gender, :date_of_birth,
            :contact_number, :presence => true

  validates :gender, inclusion: {in: %w(Male Female)}

  after_create :create_user_profile

  mount_uploader :avatar, AvatarUploader

  scope :defaulter, lambda {|target|
    includes(:course)
    .joins(:student_balances)
    .where('student_balances.due =?', true)
    .group('student_balances.amount')
    .having('sum(student_balances.amount) > ?', target)
    .references(:student_balances)
  }


  def defaulter?
    Rails.logger.info("amount payable: #{amount_payable} - #{course.defaulter_amount.to_i}")
    amount_payable >= defaulter_amount
  end

  def defaulter_amount
    self.try(:batch).try(:defaulter_amount).to_i
  end


  def due_transactions
    student_balances.due
  end

  def paid_transactions
    student_balances.paid
  end

  def email
    user.try(:email)
  end

  def amount_payable
    due_transactions > paid_transactions ? (due_transactions - paid_transactions) : 0
  end

  def balance
    paid_transactions > due_transactions ? (paid_transactions - due_transactions) : 0
  end


  def name
    [first_name, middle_name, last_name].join(' ')
  end

  def admission_number_suggestion
    if Student.count > 0 and Student.last.admission_number.length > 8
      self.persisted? ? admission_number : Student.try(:last).try(:admission_number).to_i.next

    else
      self.persisted? ? admission_number : '100000001'
    end
    #self.persisted? ? admission_number : [ActsAsTenant.try(:current_tenant).try(:id), Student.try(:last).try(:id).to_i.next].join("-")
  end


  def student_email(school_id = nil)
    target_school = School.find school_id || self.school
    "#{admission_number}@#{school.host}"
  end


  def create_user_profile
    raise "User profile already existed!" if self.try(:user)
    if self.user.nil?
      @user = User.create!({email: "#{[first_name.strip, last_name.strip, self.id].join('_')}@#{school.host}",
                            password: "student_#{id}#{123}",
                            school_id: school_id,
                            student_id: self.id
                           })
      if @user
        @user.roles.create!({title: 'student', school_id: self.school_id})
      end
      return @user
    end
  end


  def school_id=(integer)
    write_attribute(:school_id, integer)
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      first_name = row['first_name'].try(:strip)
      middle_name = row['middle_name'].try(:strip)
      last_name = row['last_name'].try(:strip)
      date_of_birth = row['date_of_birth']
      contact_number = row['contact_number']
      gender = row['gender']
      admission_number = "#{row['admission_number'].to_s.to_i}".strip
      batch = row['school year']
      course = row['class']
      course_section = row['class section']
      batch = Batch.find_by(code: batch)
      batch_id = batch.try(:id)
      course_id = batch.courses.find_by(code: course).try(:id)
      course_section_id = batch.course_sections.find_by(code: course_section).try(:id)
      @student = Student.find_by({admission_number: admission_number}) if admission_number.present?
      if  @student
        @student.update!({
                             first_name: first_name,
                             middle_name: middle_name,
                             last_name: last_name,
                             gender: gender.humanize,
                             date_of_birth: date_of_birth,
                             contact_number: contact_number,
                             batch_id: batch_id,
                             course_id: course_id,
                             course_section_id: course_section_id

                         })
      else
        @student = Student.new(
            {
                first_name: first_name,
                middle_name: middle_name,
                last_name: last_name,
                gender: gender.humanize,
                date_of_birth: date_of_birth,
                contact_number: contact_number,
                batch_id: batch_id,
                course_id: course_id,
                course_section_id: course_section_id

            }
        )
        @student.admission_number= admission_number || @student.admission_number_suggestion
        @student.save!
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then
        Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then
        Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then
        Roo::Excelx.new(file.path, nil, :ignore)
      else
        raise "Unknown file type: #{file.original_filename}"
    end
  end


end
