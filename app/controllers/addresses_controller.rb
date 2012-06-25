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

  def new
    @address = @addressable.addresses.build(params[:address])

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @address }
    end
  end



  def edit
    @address = @addressable.addresses.find_by_id(params[:id])
  end


  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
    @address = @addressable.addresses.find_by_id(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to current_user, notice: 'address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
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
