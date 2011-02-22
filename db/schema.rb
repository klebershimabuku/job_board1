# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110221140034) do

  create_table "accounts", :force => true do |t|
    t.string   "active_pack"
    t.datetime "valid_start_at"
    t.datetime "valid_end_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.string   "homepage"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "email"
    t.integer  "visits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "available",         :default => false
    t.string   "company_name"
    t.string   "company_website"
    t.string   "how_to_apply"
    t.boolean  "locked",            :default => false
    t.integer  "visits",            :default => 0
    t.integer  "account_id"
    t.datetime "published_at"
    t.datetime "campaign_start_at"
    t.datetime "campaign_end_at"
    t.boolean  "expired",           :default => false
    t.datetime "expired_at"
    t.boolean  "highlight"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",    :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                        :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                :default => false
    t.boolean  "announcer",                            :default => false
    t.boolean  "business_requested"
    t.datetime "business_requested_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
