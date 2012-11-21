class ListsController < ApplicationController

	before_filter :authenticate_user!

	def show
  		@list = List.find(params[:id])
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(params[:list])

		respond_to do |format|
  			if @list.save
   				format.html { redirect_to @list }
   				format.json { render :json => @list }
 			else
    			format.html { render :action => "new" }
  		 		format.json { render :json => @list.errors, :status => :unprocessable_entity }
 			end
		end  
	end

	def edit
    	@list = List.find(params[:id])
  	end

  	def update
	    @list = List.find(params[:id])

	    respond_to do |format|
	      if @list.update_attributes(params[:list])
	        format.html { redirect_to @list, notice: 'List was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @list.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy

		respond_to do |format|
		  format.html { redirect_to :root, notice: 'List was successfully deleted.'  }
		  format.json { head :no_content }
		end
	end
end
