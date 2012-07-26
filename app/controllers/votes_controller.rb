class VotesController < ApplicationController

	def create
		@story = Story.find_by_id( params[:target_id] )

		@vote = current_user.votes.find_or_create_by_target_id( @story.id )
		@vote.attitude = params[:attitude]
		@vote.target_type = params[:target_type]

		@vote.save
	end

	def update
		@vote = current_user.votes.find_by_id( params[:vote][:id] )
	end


end
