class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @receipts = Receipt.order(:date => :desc).all.page(params[:page])
  end
end
