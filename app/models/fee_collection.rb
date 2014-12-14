# == Schema Information
#
# Table name: fee_collections
#
#  id              :integer          not null, primary key
#  due             :boolean          default(TRUE)
#  fee_category_id :integer
#  school_id       :integer
#  student_id      :integer
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_fee_collections_on_fee_category_id  (fee_category_id)
#  index_fee_collections_on_school_id        (school_id)
#  index_fee_collections_on_student_id       (student_id)
#

class FeeCollection < ActiveRecord::Base

  paginates_per 10

  belongs_to :fee_category
  belongs_to :school
  belongs_to :student

  has_many :students, through: :fee_category

  validates :school_id, :fee_category_id, :student_id, :presence => true




end
