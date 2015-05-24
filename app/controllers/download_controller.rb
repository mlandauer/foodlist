require "csv"

class DownloadController < ApplicationController
  def index
  end

  def data
    # Create a csv
    account = current_user.account
    csv_string = CSV.generate do |csv|
      csv << ["Date (YYYY-MM-DD)", "Receipt code", "Product stock code", "Product description", "Quantity", "Total including GST"]
      account.receipts.order(date: :desc).find_each do |receipt|
        receipt.line_items.find_each do |l|
          csv << [receipt.date, receipt.code, l.product.stock_code, l.product.description, l.quantity, l.total_inc_gst]
        end
      end
    end
    send_data csv_string, :filename => "receipts.csv"
  end
end
