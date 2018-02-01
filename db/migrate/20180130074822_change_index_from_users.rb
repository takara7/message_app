class ChangeIndexFromUsers < ActiveRecord::Migration[5.1]
  def up
    add_index :users, :user_name, unique: true
    remove_index :users, :email
  end

  def down
    add_index :users, :email, unique: true
    remove_index :users, :user_name
  end
end
