class AddColumn02 < ActiveRecord::Migration
  def self.up
    add_column :guild_ranks, :rank, :integer
    add_column :skill_levels, :level, :integer
  end

  def self.down
  end
end
