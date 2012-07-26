class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :target_id
      t.string :target_type
      t.string :spin

      t.timestamps
    end
  end
end
