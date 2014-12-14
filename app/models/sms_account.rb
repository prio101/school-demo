# == Schema Information
#
# Table name: sms_accounts
#
#  id            :integer          not null, primary key
#  school_id     :integer
#  number_of_sms :integer          default(0)
#  active        :boolean          default(FALSE)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_sms_accounts_on_school_id  (school_id) UNIQUE
#

class SmsAccount < ActiveRecord::Base
  belongs_to :school
end
