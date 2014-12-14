class CreateAgentForApi < ActiveRecord::Migration
  def change
    host = Rails.env.production? ? 'http://api.skoolwings.com' : 'http://localhost.com'
    add_column :schools, :visible, :boolean, default: true
  end
end
