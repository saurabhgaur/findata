class InvestmentsController < ApplicationController
 def create
  	@investment = current_user.investments.build(params[:investment])
  	 if @investment.save
      flash[:success] = "Investment Added!"
      redirect_to current_user
    else
      flash[:success] = "Investment could not be added!"
      redirect_to current_user
    end
  end

  def destroy
  	
  	@investment = current_user.investments.find_by_id(params[:id])
  	@investment.destroy
  	flash[:success] = "Investment Destroyed!"
    redirect_to current_user
  end
end
