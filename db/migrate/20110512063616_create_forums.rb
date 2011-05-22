class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.integer :user_id
      t.string :title
      t.text :contents
      t.datetime :latest_comment_at
      t.string :mode

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
