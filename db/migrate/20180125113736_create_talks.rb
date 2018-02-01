class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
      t.integer :from_id, null: false
      t.integer :to_id,   null: false
      t.text    :content, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :talks, [:from_id, :to_id, :deleted_at]
  end
end
