class AddColumn01 < ActiveRecord::Migration
  def self.up
    add_column :forums, :comment_count, :integer
  end

  def self.down
  end
end
