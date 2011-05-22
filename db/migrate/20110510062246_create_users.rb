class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login_id
      t.string :hashed_password
      t.string :salt
      t.string :icon
      t.string :nickname
      t.string :full_name
      t.string :level
      t.integer :rank
      t.string :mail_address

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
