# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  amount           :string(255)
#  transaction_type :string(255)
#  billable_type    :string(255)
#  billable_id      :integer
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :string(255)
#  school_id        :string(255)
#
# Indexes
#
#  index_transactions_on_billable_id  (billable_id)
#  index_transactions_on_school_id    (school_id)
#  index_transactions_on_user_id      (user_id)
#

class Transaction < ActiveRecord::Base

end
