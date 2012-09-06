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

ActiveRecord::Schema.define(:version => 20120906150610) do

  create_table "#Tableau_sid_00485CC8_4_none_form_name_nk", :id => false, :force => true do |t|
    t.string  "none_form_name_nk"
    t.integer "_Tableau_join_flag", :limit => 8, :default => 0, :null => false
  end

  create_table "answers", :force => true do |t|
    t.integer  "response_id"
    t.integer  "option_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questioning_id"
    t.time     "time_value"
    t.date     "date_value"
    t.datetime "datetime_value"
  end

  add_index "answers", ["questioning_id"], :name => "index_answers_on_questioning_id"

  create_table "assignments", :force => true do |t|
    t.integer  "mission_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broadcast_addressings", :force => true do |t|
    t.integer  "broadcast_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broadcasts", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.string   "medium"
    t.text     "send_errors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "which_phone"
    t.integer  "mission_id"
  end

  add_index "broadcasts", ["mission_id"], :name => "index_broadcasts_on_mission_id"

  create_table "choices", :force => true do |t|
    t.integer  "answer_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["answer_id"], :name => "index_choices_on_answer_id"

  create_table "conditions", :force => true do |t|
    t.integer  "questioning_id"
    t.integer  "ref_qing_id"
    t.string   "op"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "option_id"
  end

  create_table "form_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mission_id"
  end

  add_index "form_types", ["mission_id"], :name => "index_form_types_on_mission_id"

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",    :default => false
    t.integer  "form_type_id"
    t.integer  "downloads"
    t.integer  "mission_id"
  end

  add_index "forms", ["mission_id"], :name => "index_forms_on_mission_id"

  create_table "languages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     :default => false
    t.string   "code"
    t.integer  "mission_id"
  end

  add_index "languages", ["mission_id"], :name => "index_languages_on_mission_id"

  create_table "missions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "compact_name"
  end

  add_index "missions", ["compact_name"], :name => "index_missions_on_compact_name"

  create_table "option_sets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ordering"
    t.integer  "mission_id"
  end

  add_index "option_sets", ["mission_id"], :name => "index_option_sets_on_mission_id"

  create_table "option_settings", :force => true do |t|
    t.integer  "option_set_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank"
  end

  create_table "options", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mission_id"
  end

  add_index "options", ["mission_id"], :name => "index_options_on_mission_id"

  create_table "question_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "odk_name"
    t.string   "odk_tag"
    t.string   "long_name"
  end

  create_table "questionings", :force => true do |t|
    t.integer  "question_id"
    t.integer  "form_id"
    t.integer  "rank"
    t.boolean  "required",    :default => false
    t.boolean  "hidden",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "code"
    t.integer  "option_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_type_id"
    t.integer  "minimum"
    t.integer  "maximum"
    t.boolean  "maxstrictly"
    t.boolean  "minstrictly"
    t.integer  "mission_id"
  end

  add_index "questions", ["mission_id"], :name => "index_questions_on_mission_id"

  create_table "report_aggregations", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "constraints"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_calculations", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "constraints"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_fields", :force => true do |t|
    t.integer  "report_report_id"
    t.integer  "question_id"
    t.integer  "question_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attrib_id"
  end

  create_table "report_groupings", :force => true do |t|
    t.string   "type"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attrib_id"
  end

  create_table "report_reports", :force => true do |t|
    t.string   "name"
    t.boolean  "saved",           :default => false
    t.integer  "filter_id"
    t.integer  "pri_grouping_id"
    t.integer  "sec_grouping_id"
    t.integer  "calculation_id"
    t.integer  "aggregation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "viewed_at"
    t.integer  "view_count",      :default => 0
    t.string   "display_type",    :default => "Table"
    t.string   "bar_style",       :default => "Side By Side"
    t.boolean  "unreviewed",      :default => false
    t.string   "percent_type"
    t.boolean  "unique_rows"
    t.integer  "mission_id"
  end

  add_index "report_reports", ["mission_id"], :name => "index_report_reports_on_mission_id"

  create_table "report_response_attributes", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "join_tables"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "groupable",   :default => false
    t.string   "data_type"
  end

  create_table "responses", :force => true do |t|
    t.integer  "form_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reviewed",   :default => false
    t.string   "source"
    t.integer  "mission_id"
  end

  add_index "responses", ["mission_id"], :name => "index_responses_on_mission_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.boolean  "location_required", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_searches", :force => true do |t|
    t.text     "str"
    t.string   "class_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mission_id"
    t.string   "key"
  end

  add_index "settings", ["mission_id"], :name => "index_settings_on_mission_id"

  create_table "translations", :force => true do |t|
    t.integer  "language_id"
    t.text     "str"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fld"
    t.string   "class_name"
    t.integer  "obj_id"
  end

  add_index "translations", ["language_id", "class_name", "fld", "obj_id"], :name => "translation_master", :unique => true

  create_table "user_batches", :force => true do |t|
    t.text     "users"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.integer  "language_id"
    t.string   "phone"
    t.string   "password_salt"
    t.string   "crypted_password"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_count",         :default => 0
    t.text     "notes"
    t.datetime "last_request_at"
    t.string   "name"
    t.string   "phone2"
    t.boolean  "admin"
    t.integer  "current_mission_id"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
