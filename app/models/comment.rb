class Comment < ActiveRecord::Base
	attr_accessible :body, :user_id, :parent_id, :parent_type

	belongs_to :user
	belongs_to :parent, :polymorphic => true
	has_many :comments, :as => :parent

	has_many :votes, :as => :target

	def story
		return @story if defined?(@story)
		@story = parent.is_a?(Story) ? parent : parent.story
	end
end