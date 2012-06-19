class AddressesController < ApplicationController
	before_filter :load_addressable
  def index
  	@addresses = @addressable.addresses
  end

  def new
    @address = @addressable.addresses.new
  end
    
  def create
    @address = @addressable.addresses.new(params[:address])
    if @address.save
      redirect_to current_user, notice: "Address Added!"
    else
      flash[:failure] = "Address could not be added!"
      redirect_to current_user
    end
  end

  def destroy
    @address = @addressable.addresses.find_by_id(params[:id])
    @address.destroy
    flash[:notice] = "Address Destroyed!"
    # redirect_to @addressable
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.js 
    end
  end



private
  def load_addressable
    resource, id = request.path.split('/')[1,2]
    @addressable = resource.singularize.classify.constantize.find_by_id(id)
  end
end
