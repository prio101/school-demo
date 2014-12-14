# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  school_id  :integer
#  batch_id   :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_classifications_on_batch_id   (batch_id)
#  index_classifications_on_school_id  (school_id)
#

class Classification < ActiveRecord::Base

end
