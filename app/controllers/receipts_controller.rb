class ReceiptsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.receipts
      @receipts = current_user.receipts.order(:date => :desc).all
    else
      @receipts = Kaminari.paginate_array([])
    end
    @receipts = @receipts.page(params[:page])
  end
end
