# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  school_id                       :integer
#  batch_id                        :integer
#  course_id                       :integer
#  username                        :string(255)
#  role                            :string(255)
#  active                          :boolean
#  created_at                      :datetime
#  updated_at                      :datetime
#  email                           :string(255)      not null
#  remember_me_token               :string(255)
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string(255)
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  to_be_authenticated_id          :integer
#  to_be_authenticated_type        :string(255)
#  student_id                      :integer
#  parent_id                       :integer
#  encrypted_password              :string(255)      default(""), not null
#  reset_password_sent_at          :datetime
#  remember_created_at             :datetime
#  sign_in_count                   :integer          default(0), not null
#  current_sign_in_at              :datetime
#  last_sign_in_at                 :datetime
#  current_sign_in_ip              :string(255)
#  last_sign_in_ip                 :string(255)
#
# Indexes
#
#  index_users_on_batch_id                (batch_id)
#  index_users_on_course_id               (course_id)
#  index_users_on_email                   (email) UNIQUE
#  index_users_on_parent_id               (parent_id)
#  index_users_on_remember_me_token       (remember_me_token)
#  index_users_on_reset_password_token    (reset_password_token)
#  index_users_on_school_id               (school_id)
#  index_users_on_to_be_authenticated_id  (to_be_authenticated_id)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_tenant(:school)

  has_many :roles
  belongs_to :school
  belongs_to :student
  # has_one :teacher
  belongs_to :parent

  validates :school_id, presence: true, numericality: true
  validates :email, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :roles

  attr_accessor :as_admin

  scope :admin, -> {includes(:roles).where("lower(roles.title) = ?", 'admin')}

  def display_name
    self.email.split('@').first
  end

  def role_symbols
    (roles || []).map {|r| r.title.downcase.to_sym}
  end

  def to_s
    [username, role_symbols.join(', ')]
  end

  def not_admin?
    !self.roles.map(&:title).include?('admin')
  end

  def ensure_user_role

  end



end
