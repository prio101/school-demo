# == Schema Information
#
# Table name: parents
#
#  id                      :integer          not null, primary key
#  full_name               :string(255)
#  primary_contract_person :boolean
#  phone_number            :string(255)
#  email                   :string(255)
#  address                 :string(255)
#  school_id               :integer
#  student_id              :integer
#  batch_id                :integer
#  classification_id       :integer
#  created_at              :datetime
#  updated_at              :datetime
#  course_id               :integer
#
# Indexes
#
#  index_parents_on_batch_id           (batch_id)
#  index_parents_on_classification_id  (classification_id)
#  index_parents_on_course_id          (course_id)
#  index_parents_on_school_id          (school_id)
#  index_parents_on_student_id         (student_id)
#

class Parent < ActiveRecord::Base
  has_one :user, as: :to_be_authenticated
  belongs_to :school

  validates :school_id, :student_id, presence: true, on: :update

  acts_as_tenant(:school)


end
