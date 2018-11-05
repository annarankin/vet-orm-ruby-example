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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_05_050134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.bigint "pet_id"
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
  end

  create_table "ar_internal_metadata", primary_key: "key", id: :string, force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
  end


  create_view :pets_with_upcoming_appointments,  sql_definition: <<-SQL
      SELECT DISTINCT ON (pets.id) pets.id,
      users.id AS user_id,
      pets.name,
      min(appointments.date) AS next_appointment_date
     FROM ((users
       JOIN pets ON ((pets.user_id = users.id)))
       LEFT JOIN appointments ON (((pets.id = appointments.pet_id) AND (appointments.date >= CURRENT_DATE))))
    GROUP BY users.id, pets.id, pets.name;
  SQL

end
