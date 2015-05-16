class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.order(:date => :desc).all.page(params[:page])
  end
end
