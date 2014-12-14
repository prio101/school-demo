# == Schema Information
#
# Table name: sms_service_configurations
#
#  id           :integer          not null, primary key
#  phone_number :string(255)
#  api_url      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class SmsServiceConfiguration < ActiveRecord::Base
  attr_accessor :phone_number, :api_url
end
