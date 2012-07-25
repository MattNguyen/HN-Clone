class Story < ActiveRecord::Base
	belongs_to :user
	validates :url, :uniqueness => true, :presence => true

	def new?
		( Time.zone.now - self.created_at ).to_i < 900
	end
end
