# == Schema Information
#
# Table name: student_balances
#
#  id               :integer          not null, primary key
#  amount           :integer          default(0)
#  school_id        :integer          not null
#  student_id       :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  reference        :string(255)
#  due              :boolean          default(TRUE)
#  transaction_id   :string(255)
#  channel          :string(255)
#  msisdn           :string(255)
#  defaulter_amount :string(255)
#
# Indexes
#
#  index_student_balances_on_school_id       (school_id)
#  index_student_balances_on_student_id      (student_id)
#  index_student_balances_on_transaction_id  (transaction_id) UNIQUE
#

class StudentBalance < ActiveRecord::Base

  using_access_control

  acts_as_tenant(:school)

  belongs_to :student
  belongs_to :school

  validates :amount, :presence => true
  validates :transaction_id, :presence => true, uniqueness: true

  scope :of, ->(id){ where(student_id: id )  }
  scope :due, -> {where(due: true).sum(:amount)}
  scope :paid, -> {where(due: false).sum(:amount)}



end
