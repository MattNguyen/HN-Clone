class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def create
		@comment = current_or_anonymous_user.comments.build params[:comment]
		@comment.parent = Story.find_by_id params[:story_id]
		@comment.save

		redirect_to story_path( @comment.parent )
	end

	def new
		@comment = Comment.new
	end

	protected

	# def get_parent
	# 	@parent = Story.find_by_id(params[:id]) if params[:id]
	# 	@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

	# 	redirect_to root_pooth unless defined?(@parent)
	# end
end
