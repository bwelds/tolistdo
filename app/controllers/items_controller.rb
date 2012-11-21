class ItemsController < ApplicationController
	before_filter :authenticate_user!

	def show
		@list = List.find(params[:list_id])
  		@item = Item.find(params[:id])
  		
	end

	def new
		@list = List.find(params[:list_id])
		@item = Item.new

	end

	def create
		@list = List.find(params[:list_id])
		@item = Item.new(params[:item])

		respond_to do |format|
  			if @item.save
   				format.html { redirect_to @list }
   				format.json { render :json => @item }
 			else
    			format.html { render :action => "new" }
  		 		format.json { render :json => @item.errors, :status => :unprocessable_entity }
 			end
		end  
	end


	def edit
    	@list = List.find(params[:list_id])
  		@item = Item.find(params[:id])
  	end

  	def update
	    @list = List.find(params[:list_id])
  		@item = Item.find(params[:id])

	    respond_to do |format|
	      if @item.update_attributes(params[:item])
	        format.html { redirect_to @list, notice: 'Item was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @item.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@list = List.find(params[:list_id])
		@item = Item.find(params[:id])
		@item.destroy

		respond_to do |format|
		  format.html { redirect_to @list, notice: 'Item was successfully deleted.'  }
		  format.json { head :no_content }
		end
	end

end
