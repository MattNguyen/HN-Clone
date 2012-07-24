class LinksController < ApplicationController
	def index
		@links = Link.scoped.order('created_at DESC').page(params[:page])
		@link = Link.new
	end

	def create
		@link = Link.new(params[:link])
		
		flash[:error] = "Making itself intelligible is suicide for philosophy. But not for links, stupid." unless @link.save

		redirect_to :links
	end

	def new
		@link = Link.new
	end
end
