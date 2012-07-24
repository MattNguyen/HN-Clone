class LinksController < ApplicationController
	def index
		@links = Link.scoped.order('created_at DESC').page(params[:page])
		@link = Link.new
	end

	def create
		@link = Link.new(params[:link])
		@link.user = current_user || anonymous_user

		heidegger = "Making itself intelligible is suicide for philosophy. But not for links, stupid."
		flash[:error] = heidegger unless @link.save

		redirect_to :root
	end

	def new
		@link = Link.new
	end
end
