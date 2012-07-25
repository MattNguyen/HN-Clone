class LinksController < ApplicationController
	before_filter :signed_in_user, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :find_id, :only => [:edit, :update, :show]

	def index
		@links = Link.order('created_at DESC').page(params[:page])
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

	def update
		@link.update_attributes(params[:link])
		redirect_to :root
	end

	def show
	end

	def edit
	end

	private

	def find_id
		@link = Link.find(params[:id])
	end

	def signed_in_user
		redirect_to :root, :notice => "Please sign in." unless signed_in?
	end

	def correct_user
		user = Link.find(params[:id]).user
		redirect_to :root, :notice => "That ain't yours." unless current_user?(user)
	end
end
