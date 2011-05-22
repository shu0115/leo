class CreateGuildRanks < ActiveRecord::Migration
  def self.up
    create_table :guild_ranks do |t|
      t.integer :user_id
      t.integer :target_user_id
      t.string :approval

      t.timestamps
    end
  end

  def self.down
    drop_table :guild_ranks
  end
end
