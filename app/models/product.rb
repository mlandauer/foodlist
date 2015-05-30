class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :stock_code

  def line_items_for_account(account)
    LineItem.joins(:receipt).where(product: self,
                                   receipts: { account_id: account.id })
  end

  def total_inc_gst(account)
    line_items_for_account(account).sum(:total_inc_gst)
  end

  def average_time_between_purchases(account)
    # TODO: We should really base this on the earliest and latest time of all
    # the receipts
    earliest_time = account.receipts.minimum(:date)
    latest_time = account.receipts.maximum(:date)
    number = line_items_for_account(account).count
    ((latest_time - earliest_time) / number).round
  end
end
