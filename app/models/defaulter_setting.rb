# == Schema Information
#
# Table name: defaulter_settings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  amount     :string(255)
#  batch_id   :integer
#  current    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class DefaulterSetting < ActiveRecord::Base
  belongs_to :batch

  def students
    batch.students
  end

end
