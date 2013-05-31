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

ActiveRecord::Schema.define(:version => 20100324212147) do

  create_table "contacts", :force => true do |t|
    t.string   "salutation"
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kiez"
  end

  create_table "files", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.integer  "artist_id"
    t.integer  "event_id"
    t.integer  "post_id"
    t.string   "filename"
    t.string   "type"
    t.string   "checksum"
    t.string   "uri"
    t.string   "comment"
    t.string   "content_type"
    t.integer  "size_in_bytes"
    t.binary   "data",          :limit => 2097152
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "place_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.integer  "lastchange_by", :null => false
    t.string   "title"
    t.string   "address"
    t.string   "kiez"
    t.text     "description"
    t.decimal  "size"
    t.decimal  "price"
    t.decimal  "price2"
    t.decimal  "totalprice"
    t.string   "url"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "lat"
    t.decimal  "lng"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "contact_person"
    t.string   "url"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "category"
    t.string   "kind"
    t.text     "address"
    t.text     "description"
    t.text     "comment"
    t.integer  "expire_days"
    t.datetime "activated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kiez"
    t.decimal  "lat"
    t.decimal  "lng"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.boolean  "is_admin",                                :default => false, :null => false
    t.string   "login"
    t.string   "name"
    t.string   "email"
    t.string   "remember_token"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "activation_code",           :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.datetime "last_activity_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
