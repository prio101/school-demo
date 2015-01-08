class AddCardIdToStudent < ActiveRecord::Migration
  def change
    add_reference :students, :card, index: true
  end
end
