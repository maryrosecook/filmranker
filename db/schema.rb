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

ActiveRecord::Schema.define(:version => 0) do

  create_table "views", :force => true do |t|
    t.string   "status",              :limit => 500
    t.integer  "film_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
=======
    t.integer  "user_id"
    t.integer  "favourite",                 :default => 0
>>>>>>> b68a23a... Updated schema to latest
  end

  create_table "films", :force => true do |t|
    t.string   "name",              :limit => 500
    t.string   "score"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string "username", :limit => 500
  end

end
