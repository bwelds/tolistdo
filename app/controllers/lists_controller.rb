class ListsController < ApplicationController

	before_filter :authenticate_user!

	def show
  		@list = current_user.lists.find(params[:id])
  		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
	end

	def new
		@list = current_user.lists.new
	end

	def create
		@list = current_user.lists.new(params[:list])

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
    	@list = current_user.lists.find(params[:id])
    	rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
  	end

  	def update
	    @list = current_user.lists.find(params[:id])
	    rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root

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
		@list = current_user.lists.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
		@list.destroy

		respond_to do |format|
		  format.html { redirect_to :root, notice: 'List was successfully deleted.'  }
		  format.json { head :no_content }
		end
	end
end
