# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110520013611) do

  create_table "forum_comments", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "contents"
    t.datetime "latest_comment_at"
    t.string   "mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comment_count"
  end

  create_table "guild_ranks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "target_user_id"
    t.string   "approval"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  create_table "lounges", :force => true do |t|
    t.integer  "user_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "sex"
    t.date     "birth_day"
    t.string   "blood_type"
    t.string   "constellation"
    t.string   "home"
    t.string   "residence"
    t.string   "web_site"
    t.string   "twitter_id"
    t.string   "skype_id"
    t.string   "paypal_link"
    t.string   "github_id"
    t.string   "lastfm_id"
    t.string   "public_mode"
    t.integer  "point"
    t.string   "status"
    t.integer  "approval_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_levels", :force => true do |t|
    t.integer  "user_id"
    t.integer  "target_user_id"
    t.integer  "skill_id"
    t.string   "approval"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level"
  end

  create_table "skills", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", :force => true do |t|
    t.integer  "skill_id"
    t.integer  "user_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_statuses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "point"
    t.string   "status"
    t.integer  "approval_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login_id"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "icon"
    t.string   "nickname"
    t.string   "full_name"
    t.string   "level"
    t.integer  "rank"
    t.string   "mail_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
