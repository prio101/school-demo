# == Schema Information
#
# Table name: fee_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  recurrent  :boolean          default(FALSE)
#  school_id  :integer
#  fee        :string(255)
#
# Indexes
#
#  index_fee_categories_on_fee        (fee)
#  index_fee_categories_on_school_id  (school_id)
#

class FeeCategory < ActiveRecord::Base

  paginates_per 10

  has_many :course_sections
  has_many :students, :through => :course_sections
  belongs_to :user
  belongs_to :school

  has_many :collection_schedules

  accepts_nested_attributes_for :collection_schedules, allow_destroy: true

  validates :name, :school_id , :presence => true

  acts_as_tenant(:school)

end
