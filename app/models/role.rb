# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  school_id  :string(255)
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_roles_on_school_id  (school_id)
#  index_roles_on_user_id    (user_id)
#

class Role < ActiveRecord::Base

  belongs_to :user

  validates :user_id, :school_id, :title, :presence => true

  acts_as_tenant(:school)


end
