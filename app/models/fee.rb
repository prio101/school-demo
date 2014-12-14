# == Schema Information
#
# Table name: fees
#
#  id                :integer          not null, primary key
#  amount            :integer
#  currency          :string(255)
#  school_id         :integer
#  batch_id          :integer
#  classification_id :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  course_id         :integer
#
# Indexes
#
#  index_fees_on_batch_id           (batch_id)
#  index_fees_on_classification_id  (classification_id)
#  index_fees_on_course_id          (course_id)
#  index_fees_on_school_id          (school_id)
#

class Fee < ActiveRecord::Base

  paginates_per 10

  belongs_to :school
  validates :currency, :school_id, :amount, :batch_id, :course_id, presence: true
  validates :amount, numericality: true

  belongs_to :batch
  belongs_to :course

  acts_as_tenant(:school)

end
