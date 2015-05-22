class Product < ActiveRecord::Base
  def line_items(account)
    LineItem.joins(:receipt).where(product: self, receipts: {account_id: account.id})
  end

  def total_inc_gst(account)
    line_items(account).sum(:total_inc_gst)
  end
end
