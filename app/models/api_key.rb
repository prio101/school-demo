# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  client_id    :integer
#  access_token :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_api_keys_on_client_id  (client_id)
#

class ApiKey < ActiveRecord::Base
  belongs_to :client

  validates :client_id, presence: true

  before_create :generate_access_token

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end
