class PagesController < ApplicationController
	before_filter :authenticate_user!
	def index
			@lists = current_user.lists.all
	end
end
