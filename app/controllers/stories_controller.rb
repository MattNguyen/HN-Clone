class StoriesController < ApplicationController
	before_filter :signed_in_user, :only => [:edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
	before_filter :find_id, :only => [:edit, :update, :show]

	def index
		@stories = Story.order('created_at DESC').page( params[:page] )
		@story  = Story.new
	end

	def create
		@story      = Story.new( params[:story] )
		@story.user = current_user || anonymous_user

		heidegger = "Making itself intelligible is suicide for philosophy. But not for stories, stupid."
		flash[:error] = heidegger unless @story.save

		redirect_to :root
	end

	def new
		@story = Story.new
	end

	def update
		@story.update_attributes( params[:story] )

		redirect_to :root
	end

	def show
	end

	def edit
	end

	private

	def find_id
		@story = Story.find( params[:id] )
	end
end
