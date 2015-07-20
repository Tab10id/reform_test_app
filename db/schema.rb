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

ActiveRecord::Schema.define(:version => 20150708091258) do

  create_table "post_commit_action_condition_groups", :force => true do |t|
    t.integer  "action_id"
    t.integer  "parent_id"
    t.string   "cond_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_commit_action_condition_groups", ["action_id"], :name => "index_post_commit_action_condition_groups_on_action_id"
  add_index "post_commit_action_condition_groups", ["parent_id"], :name => "index_post_commit_action_condition_groups_on_parent_id"

  create_table "post_commit_action_conditions", :force => true do |t|
    t.string   "type"
    t.integer  "condition_group_id"
    t.string   "value"
    t.boolean  "invert",             :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "post_commit_action_conditions", ["condition_group_id"], :name => "index_post_commit_action_conditions_on_condition_group_id"

  create_table "post_commit_actions", :force => true do |t|
    t.string   "type"
    t.string   "description"
    t.string   "url"
    t.string   "repository_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
