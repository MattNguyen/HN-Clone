class ChangeSpinToAttitudeInVotes < ActiveRecord::Migration
	def change
		rename_column :votes, :spin, :attitude
	end
end
