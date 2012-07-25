class AddUserIdToLinks < ActiveRecord::Migration
  def change
  	add_column :storys, :user_id, :integer
  end
end
