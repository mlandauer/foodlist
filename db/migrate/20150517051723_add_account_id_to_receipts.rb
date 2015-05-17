class AddAccountIdToReceipts < ActiveRecord::Migration
  def change
    add_reference :receipts, :account, index: true, foreign_key: true
  end
end
