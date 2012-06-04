class FamilyMembersController < ApplicationController
  def create
  	@family_member = current_user.family_members.build(params[:family_member])
  	 if @family_member.save
      flash[:success] = "Family Member Added!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  	
  	@family_member = current_user.family_members.find_by_id(params[:id])
  	@family_member.destroy
  	flash[:success] = "Family Member Destroyed!"
    redirect_to root_path
  end
end
