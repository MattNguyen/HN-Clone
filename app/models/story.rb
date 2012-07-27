class Story < ActiveRecord::Base
	belongs_to :user
	has_many :votes, :as => :target
	has_many :comments, :as => :parent

	before_save :sentence_finisher
	validates :url, :uniqueness => true, :presence => true

	def votable_by?(user)
		!self.belongs_to?( user ) && !self.voted_on_by?( user )
	end

	def new?
		( Time.zone.now - self.created_at ).to_i < 900
	end

	def sentence_finisher
		self.title = self.title + "?" if self.title.match( /[^A-Z]$\b/ )
	end

	def belongs_to?(user)
		self.user == user
	end

	def voted_on_by?(user)
		self.votes.find_by_user_id( user.id )
	end

	def score
		self.upvotes.count - self.downvotes.count
	end

	def upvotes
		self.votes.where(:attitude => 'positive')
	end

	def downvotes
		self.votes.where(:attitude => 'negative')
	end
end