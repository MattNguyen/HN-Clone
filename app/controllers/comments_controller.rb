class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def create
		@comment = @parent.comments.new(params[:comment])
		@comment.save

		redirect_to stories_path(@comment.story)
	end

	def new
		@comment = Comment.new
	end

	protected

	def get_parent
		@parent = Story.find_by_id(params[:story_id]) if params[:story_id]
		@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

		redirect_to root_pooth unless defined?(@parent)
	end
end
