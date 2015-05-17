class UploadsController < ApplicationController
  # TODO This should only be accessible by admin users
  before_action :authenticate_user!

  def new
  end

  def create
    csv_file = params[:export]
    CsvReader.load_csv(csv_file.path) do |hash|
      p hash
      account = Account.find_or_create_by(ref: hash["AccountRef"])
      # We're assuming that each receipt only ever has one account but let's double check that as
      # we go along and error if that isn't the case
      receipt = Receipt.find_by(code: hash["TransRefCode"])
      if receipt
        raise "Receipt has more than one date" unless receipt.date == Date.parse(hash["TransDate"])
        raise "Receipt has more than one account" unless receipt.account = account
      else
        receipt = Receipt.create(code: hash["TransRefCode"], date: Date.parse(hash["TransDate"]),
          account: account)
      end
      product = Product.find_or_create_by(stock_code: hash["StockCode"], description: hash["StockDesc"])
      LineItem.find_or_create_by(receipt: receipt, product: product,
        line_no: hash["DetailNo"], quantity: hash["LineQty"], total_ex_gst: hash["LineTotalExGST"],
        total_inc_gst: hash["LineTotalIncGST"])
    end

    redirect_to :root, flash: {alert: "Uploaded succesfully"}
  end
end
