module VotesHelper
	def vote_params(attitude, target)

		case attitude
		when :positive
			{:target_id => target.id, :target_type => "Story", :attitude => "positive"}
		when :negative			
			{:target_id => target.id, :target_type => "Story", :attitude => "positive"}
		end

	end
end
