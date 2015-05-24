class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html do
        if current_user.receipts
          @receipts = current_user.receipts.order(:date => :desc).all
        else
          @receipts = Kaminari.paginate_array([])
        end
        @receipts = @receipts.page(params[:page])
      end

      format.csv do
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
  end
end
