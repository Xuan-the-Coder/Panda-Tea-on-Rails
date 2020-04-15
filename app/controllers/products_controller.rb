class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count, only: %i[index]
  before_action :load_cart

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

  def edit_quantity
    id = params[:id].to_i
    session[:cart][id] = params[:quantity]
    redirect_to root_path
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart][id] = 1 unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    id = param[:id].to_i
    session[:cart].delete(id)
  end
  private

  def initialize_session
    session[:visit_count] ||=0
    session[:cart] ||={}
  end

  def load_cart
    keys = session[:cart].collect {|key,value| key }
    @cart = Product.find(keys)
    @var = session[:cart]

  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
