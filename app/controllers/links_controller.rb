class LinksController < ApplicationController
	def index
		@links = Link.all
		@link = Link.new
	end

	def create
		@link = Link.new(params[:link])
		
		if @link.save
			flash[:success] = "Success, human."
		else
			flash[:error] = "You broke it."
		end

		redirect_to :links
	end

	def new
		@link = Link.new
	end
end
