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

ActiveRecord::Schema.define(:version => 20111020174548) do

  create_table "companies", :force => true do |t|
    t.string  "name",                :null => false
    t.string  "status", :limit => 1, :null => false
    t.integer "number",              :null => false
  end

  create_table "words", :force => true do |t|
    t.string  "human"
    t.string  "computer"
    t.boolean "shortlist"
    t.boolean "domain_available"
    t.boolean "flag_for_purchase"
  end

  add_index "words", ["computer"], :name => "index_words_on_computer"
  add_index "words", ["human"], :name => "index_words_on_human"

end
