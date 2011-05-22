class CreateLounges < ActiveRecord::Migration
  def self.up
    create_table :lounges do |t|
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :lounges
  end
end
