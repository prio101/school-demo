# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  client_key  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  client_name :string(255)
#
# Indexes
#
#  index_clients_on_client_key  (client_key)
#

class Client < ActiveRecord::Base

  validates :client_key, :client_name ,:presence => true

  has_many :api_keys

  before_validation :generate_client_key, on: :create
  after_create :create_api_key

  private

  def generate_client_key
    begin
      self.client_key = SecureRandom.hex
    end while self.class.exists?(client_key: client_key )
  end

  def create_api_key
    self.api_keys.create!
  end


end
