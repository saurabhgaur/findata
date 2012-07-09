class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user

  def index
    flash[:notice] = "User Index"
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @family_member = current_user.family_members.build
    @investment = current_user.investments.build
    @addressable = current_user
    @address = current_user.addresses.build
  end

  def sendmail
    @notifyees = current_user.family_members.select {|family_member| family_member.notify?}
    logger.debug("hello from the User controller Sendmail action")
    UserMailer.investments_email(@user).deliver
  end

private
  def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  def current_user?(user)
      user == current_user
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
      @current_controller = controller_name
  end 

end
