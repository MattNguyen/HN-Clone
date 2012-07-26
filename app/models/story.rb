class Story < ActiveRecord::Base
	belongs_to :user
	before_save :sentence_finisher
	validates :url, :uniqueness => true, :presence => true

	def new?
		( Time.zone.now - self.created_at ).to_i < 900
	end

	def sentence_finisher
		self.title = self.title + "?" if self.title.match( /[^A-Z]$\b/ )
	end

	def belongs_to?(user)
		self.user == user
	end
end