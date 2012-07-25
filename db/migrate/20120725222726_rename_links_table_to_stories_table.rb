class RenameLinksTableToStoriesTable < ActiveRecord::Migration
  def change
  	rename_table :links, :stories
  end
end
