class InvestmentsController < ApplicationController
 def create
  	@investment = current_user.investments.build(params[:investment])
  	if @investment.save
      flash[:notice] = "Investment Added!"
      redirect_to current_user
    else
      flash[:failure] = "Investment could not be added!"
      respond_to do |format|
        format.html { render action: "new"}
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
      
    end

    # respond_to do |format|
    #     if @investment.save
    #       format.html 
    #       format.json { render json: @investment, status: :created, location: @investment }
    #     else
    #       format.html { render action: "new"}
    #       format.json { render json: @investment.errors, status: :unprocessable_entity }
    #     end
    # end
  end
  
  def new
    @investment = current_user.investments.build(params[:investment])
    # @secondary_owner_candidates = "'"+ stringify(current_user.family_members().map(&:name)) + "'"
    @secondary_owner_candidates = stringify(current_user.family_members().map(&:name)<<current_user.name)
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @investment }
    end
  end



  def edit
    @investment = current_user.investments.find_by_id(params[:id])
  end


  # PUT /investments/1
  # PUT /investments/1.json
  def update
    @investment = current_user.investments.find_by_id(params[:id])
    @secondary_owner_candidates = stringify(current_user.family_members().map(&:name)<<current_user.name)

    respond_to do |format|
      if @investment.update_attributes(params[:investment])
        format.html { redirect_to current_user, notice: 'Investment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
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
  
  private
    def stringify(arg)
        return "[\"" + arg.join("\", \"") + "\"]" if arg.class == Array
        "'#{arg}'"
    end
end
