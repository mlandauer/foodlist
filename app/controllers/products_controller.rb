class ProductsController < ApplicationController
  def index
    @products = Product.order(:stock_code).all
  end
end
