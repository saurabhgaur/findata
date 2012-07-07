class HomeController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    if user_signed_in?
    	redirect_to user_path(current_user)
    end
  end
end
