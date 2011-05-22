class CreateForumComments < ActiveRecord::Migration
  def self.up
    create_table :forum_comments do |t|
      t.integer :forum_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :forum_comments
  end
end
