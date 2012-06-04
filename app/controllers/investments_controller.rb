class InvestmentsController < ApplicationController
 def create
  	@investment = current_user.investments.build(params[:investment])
  	 if @investment.save
      flash[:success] = "Investment Added!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  	
  	@investment = current_user.investments.find_by_id(params[:id])
  	@investment.destroy
  	flash[:success] = "Investment Destroyed!"
    redirect_to root_path
  end
end
