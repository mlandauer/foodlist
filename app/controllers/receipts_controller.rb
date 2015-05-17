class ReceiptsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @receipts = current_user.receipts.order(:date => :desc).all.page(params[:page])
  end
end
