class ProductsController < ApplicationController
  def index
    @products = Product.where("stock_code != ''").order("CAST(stock_code AS int)").all
  end

  def show
    @product = Product.find(params[:id])
  end
end
