class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :sex
      t.date :birth_day
      t.string :blood_type
      t.string :constellation
      t.string :home
      t.string :residence
      t.string :web_site
      t.string :twitter_id
      t.string :skype_id
      t.string :paypal_link
      t.string :github_id
      t.string :lastfm_id
      t.string :public_mode
      t.integer :point
      t.string :status
      t.integer :approval_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
