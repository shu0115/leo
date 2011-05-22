class CreateSkillLevels < ActiveRecord::Migration
  def self.up
    create_table :skill_levels do |t|
      t.integer :user_id
      t.integer :target_user_id
      t.integer :skill_id
      t.string :approval

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_levels
  end
end
