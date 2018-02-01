class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :friend_id, null: false, index: true

      t.timestamps
    end
  end
end
