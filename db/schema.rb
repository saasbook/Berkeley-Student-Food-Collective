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

ActiveRecord::Schema.define(version: 2019_04_27_213037) do

  create_table "certifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutritions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packagings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_certifications", force: :cascade do |t|
    t.integer "product_id"
    t.integer "certification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_product_certifications_on_certification_id"
    t.index ["product_id"], name: "index_product_certifications_on_product_id"
  end

  create_table "product_nutritions", force: :cascade do |t|
    t.integer "product_id"
    t.integer "nutrition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutrition_id"], name: "index_product_nutritions_on_nutrition_id"
    t.index ["product_id"], name: "index_product_nutritions_on_product_id"
  end

  create_table "product_packagings", force: :cascade do |t|
    t.integer "product_id"
    t.integer "packaging_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["packaging_id"], name: "index_product_packagings_on_packaging_id"
    t.index ["product_id"], name: "index_product_packagings_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.boolean "vegan"
    t.boolean "gluten_free"
    t.boolean "dairy_free"
    t.boolean "lc_based"
    t.boolean "fair"
    t.boolean "eco_sound"
    t.boolean "humane"
    t.string "upc"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "origin"
    t.text "cultural_history"
    t.string "picture"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "type"
    t.string "name"
  end

  create_table "vendor_ownerships", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "ownership_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownership_id"], name: "index_vendor_ownerships_on_ownership_id"
    t.index ["vendor_id"], name: "index_vendor_ownerships_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "facebook"
    t.string "twitter"
    t.string "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "story"
    t.text "mission"
    t.string "picture"
  end

end
