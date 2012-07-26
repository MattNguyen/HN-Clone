class Vote < ActiveRecord::Base
	attr_accessible :target_id, :target_type, :attitude, :target

	belongs_to :target, :polymorphic => true
	belongs_to :user
end