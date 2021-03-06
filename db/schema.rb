# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20150327191704) do

  create_table "drinks", :force => true do |t|
    t.text    "name"
    t.text    "category"
    t.text    "description"
    t.integer "event_id"
  end

  create_table "events", :force => true do |t|
    t.text    "start_time"
    t.text    "host_msg"
    t.integer "current_event"
    t.integer "film_id"
  end

  create_table "events_patrons", :force => true do |t|
    t.integer "event_id"
    t.integer "patron_id"
  end

  create_table "films", :force => true do |t|
    t.text    "title"
    t.integer "year"
    t.integer "length"
    t.text    "synopsis"
    t.text    "trailer"
    t.integer "rt_rating"
  end

  create_table "patrons", :force => true do |t|
    t.text   "first_name"
    t.text   "last_name"
    t.text   "username"
    t.text   "password_digest"
    t.string "email"
  end

end
