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

ActiveRecord::Schema.define(:version => 20101022093537) do

  create_table "companies", :force => true do |t|
    t.string   "ondernemingsnummer"
    t.string   "naam"
    t.string   "logo_url"
    t.string   "straat"
    t.string   "huisnummer"
    t.string   "gemeente"
    t.string   "contactpersoon"
    t.string   "email"
    t.string   "telefoonnummer"
    t.string   "beschrijving"
    t.string   "sector"
    t.string   "regio"
    t.string   "website"
    t.text     "geschiedenis"
    t.string   "maandag"
    t.string   "dinsdag"
    t.string   "woensdag"
    t.string   "donderdag"
    t.string   "vrijdag"
    t.string   "zaterdag"
    t.string   "zondag"
    t.string   "wachtwoord"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
