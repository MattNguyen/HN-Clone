class CommentsController < ApplicationController
	before_filter :get_parent, :only => [:create, :new]

	def index
		@comments = Comment.all
	end

	def create
		@comment = current_or_anonymous_user.comments.build params[:comment]
		@comment.parent = @parent
		@comment.save

		redirect_to story_path( @comment.story )
	end

	def new
		@comment = @parent
		@new_comment = Comment.new
	end

	protected

	def get_parent
		@parent = Story.find_by_id(params[:story_id]) if params[:story_id]
		@parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

		redirect_to root_path unless defined?(@parent)
	end
end
