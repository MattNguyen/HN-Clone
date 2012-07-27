class Comment < ActiveRecord::Base
	attr_accessible :body

	belongs_to :user
	belongs_to :parent, :polymorphic => true

	has_many :votes, :as => :target

	def story
		return @story if defined?(@story)
		@story = target.is_a?(Story) ? target : target.story
	end

end