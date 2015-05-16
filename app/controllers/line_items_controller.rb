class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all.page(params[:page])
  end
end
