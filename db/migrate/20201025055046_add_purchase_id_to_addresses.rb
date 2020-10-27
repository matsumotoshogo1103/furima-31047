class AddPurchaseIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :purchase, foreign_key: true, null: false
  end
end
