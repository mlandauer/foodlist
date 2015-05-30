class ProductsController < ApplicationController
  def index
    #@products = Product.where("stock_code != ''").order("CAST(stock_code AS int)").all
    @products = Product
      .where("stock_code != ''")
      .joins(line_items: :receipt)
      .where(receipts: { account_id: current_account.id })
      .group('products.id')
      .select('products.*, count(*) as count_all')
      .order('count_all desc')
      .all
  end

  def show
    @product = Product.friendly.find(params[:id])
  end
end
