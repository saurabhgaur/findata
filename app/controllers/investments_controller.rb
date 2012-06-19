class InvestmentsController < ApplicationController
 def create
  	@investment = current_user.investments.build(params[:investment])
  	 if @investment.save
      flash[:notice] = "Investment Added!"
      redirect_to current_user
    else
      flash[:failure] = "Investment could not be added!"
      redirect_to current_user
    end
  end

  def destroy
  	@investment = current_user.investments.find_by_id(params[:id])
  	@investment.destroy
  	flash[:notice] = "Investment Destroyed!"
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.js 
    end
    # redirect_to current_user
  end

end
