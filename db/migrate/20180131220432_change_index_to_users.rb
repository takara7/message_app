class ChangeIndexToUsers < ActiveRecord::Migration[5.1]
  def up
    remove_index :users, :user_name
    add_index :users, [:user_name, :deleted_at], unique: true
  end

  def down
    remove_index :users, [:user_name, :deleted_at]
    add_index :users, :user_name, unique: true
  end
end
