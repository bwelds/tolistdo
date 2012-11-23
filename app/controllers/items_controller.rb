class ItemsController < ApplicationController
	before_filter :authenticate_user!

	def show
		@list = current_user.lists.find(params[:list_id])
  		@item = @list.items.find(params[:id])
  		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
	end

	def new
		@list = current_user.lists.find(params[:list_id])
		@item = @list.items.new
		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
	end

	def create
		@list = current_user.lists.find(params[:list_id])
		@item = @list.items.new(params[:item])
		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root

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
    	@list = current_user.lists.find(params[:list_id])
  		@item = @list.items.find(params[:id])
  		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
  	end

  	def update
	    @list = current_user.lists.find(params[:list_id])
  		@item = @list.items.find(params[:id])
  		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root

	    respond_to do |format|
	      if @item.update_attributes(params[:item])
	        format.html { redirect_to list_item_path(@list, @item), notice: 'Item was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @item.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@list = current_user.lists.find(params[:list_id])
  		@item = @list.items.find(params[:id])
  		rescue ActiveRecord::RecordNotFound => e
  			flash[:warning] = "Stop playing around with your urls"
  			redirect_to :root
		@item.destroy

		respond_to do |format|
		  format.html { redirect_to @list, notice: 'Item was successfully deleted.'  }
		  format.json { head :no_content }
		end
	end


end
