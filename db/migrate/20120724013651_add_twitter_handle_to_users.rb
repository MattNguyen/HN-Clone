class AddTwitterHandleToUsers < ActiveRecord::Migration
  def up
  	add_column(:users, :twitter_handle, :string)
  end

  def down
  	remove_column(:users, :email)
  	remove_column(:users, :name)
  end
end
