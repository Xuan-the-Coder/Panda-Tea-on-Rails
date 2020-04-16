class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_signed_in?
  def show
  end


end
