class LinksController < ApplicationController
	def index
		@links = Link.scoped.page(params[:page])
		@link = Link.new
	end

	def create
		@link = Link.new(params[:link])
		if !@link.save
			flash[:success] = "You successfully added a new link!"
		else
			flash[:error] = "Don't suck."
		end
		redirect_to :links
	end

	def new
		@link = Link.new
	end
end
