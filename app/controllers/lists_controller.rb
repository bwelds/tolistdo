class ListsController < ApplicationController

	before_filter :authenticate_user!

	def show
    	@list = List.find(params[:id])
    	# puts @list
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

end
