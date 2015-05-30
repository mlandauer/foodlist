class LineItem < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :product

  scope :for_account, ->(account) { joins(:receipt).where(receipts: { account_id: account.id }) }
end
