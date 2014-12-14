# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  details     :string(255)
#  banner      :string(255)
#  logo        :string(255)
#  active      :boolean
#  code        :string(255)
#  domain      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  visible     :boolean          default(TRUE)
#  sms_api_url :string(255)
#

class School < ActiveRecord::Base
  has_many :students
  has_many :batches
  has_many :courses, through: :batches
  has_many :fees
  has_many :users
  has_many :parents
  has_many :user
  has_one :sms_account


  validates :name, :code, :presence => true
  validates :domain, :uniqueness => true ,presence: true,
            :format => URI::regexp

  after_create :create_school_admin_user
  after_create :create_school_sms_account


  def host
    URI.parse(domain).try(:host)
  end

  def create_school_sms_account
    sms_account = SmsAccount.create(school_id: self.id)
    sms_account.save
  end

  def self.student_migration(student_id, target_school_id, academic = {})
    @student = Student.unscoped.find student_id
    @student.admission_number= "#{target_school_id}-#{@student.id}"
    @student.school_id = target_school_id
    @student.save
  end

  def create_school_admin_user
      ActsAsTenant.with_tenant(self) do
        admin_user = User.create(email: "admin@#{self.host}", password: '12345678', as_admin: true)
        if admin_user.save
          admin_user.roles.create!(title: 'admin')
        end
      end
  end


end
