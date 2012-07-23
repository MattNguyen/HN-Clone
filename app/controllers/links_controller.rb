class LinksController < ApplicationController
	def index
		@links = Link.scoped.page(params[:page])
		# @links = Link.all
		@link = Link.new
	end

	def create
		@link = Link.new(params[:link])
		@link.save
		redirect_to :links
	end

	def new
		@link = Link.new
	end
end
