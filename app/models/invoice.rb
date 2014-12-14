# == Schema Information
#
# Table name: invoices
#
#  id             :integer          not null, primary key
#  fee_id         :integer
#  school_id      :integer
#  title          :string(255)
#  state          :integer
#  user_id        :integer
#  voided_at      :date
#  paid_at        :datetime
#  due_at         :date
#  course_id      :string(255)
#  batch_id       :integer
#  amount         :string(255)
#  invoice_number :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_invoices_on_batch_id   (batch_id)
#  index_invoices_on_course_id  (course_id)
#  index_invoices_on_fee_id     (fee_id)
#  index_invoices_on_school_id  (school_id)
#  index_invoices_on_user_id    (user_id)
#

class Invoice < ActiveRecord::Base


  belongs_to :batch
  belongs_to :course
  belongs_to :school

  acts_as_tenant(:school)

  using_access_control


end
