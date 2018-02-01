class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_name,       null: false
      t.string :display_name,    null: false
      t.string :password_digest, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
