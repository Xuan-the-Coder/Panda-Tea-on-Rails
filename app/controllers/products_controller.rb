class ProductsController < ApplicationController
  def index
    @products = Product.all.order(:name).page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('name LIKE ? AND category_id = ?',
                              "%#{params[:search_term]}%",
                              params[:category_id].to_s)
  end
end
