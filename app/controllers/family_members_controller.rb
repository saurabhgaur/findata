class FamilyMembersController < ApplicationController
  def create
  	@family_member = current_user.family_members.build(params[:family_member])
  	 if @family_member.save
      flash[:notice] = "Family Member Added!"
      redirect_to current_user
    else
       flash[:failure] = "Family Member could not be added!"
      redirect_to current_user
    end
  end

  def new
    @family_member = current_user.family_members.build(params[:family_member])
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @family_member }
    end
  end



  def edit
    @family_member = current_user.family_members.find_by_id(params[:id])
    @addressable = @family_member
    @address = @family_member.addresses.build
  end


  # PUT /family_members/1
  # PUT /family_members/1.json
  def update
    @family_member = current_user.family_members.find_by_id(params[:id])

    respond_to do |format|
      if @family_member.update_attributes(params[:family_member])
        format.html { redirect_to current_user, notice: 'Family Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	
  	@family_member = current_user.family_members.find_by_id(params[:id])
  	@family_member.destroy
  	flash[:notice] = "Family Member Destroyed!"
    # redirect_to current_user
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.js 
    end 
  end

  def stringify(arg)
      return "[ '" + arg.join("', '") + "' ]" if arg.class == Array
      "'#{arg}'"
  end
end
