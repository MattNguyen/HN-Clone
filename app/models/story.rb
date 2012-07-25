class Story < ActiveRecord::Base
	belongs_to :user
	validates :url, :uniqueness => true, :presence => true
end
