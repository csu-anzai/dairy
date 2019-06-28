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

ActiveRecord::Schema.define(version: 2019_06_28_041327) do

  create_table "addons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "subscription_id"
    t.decimal "quantity", precision: 10
    t.bigint "unit_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "remarks"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_addons_on_subscription_id"
    t.index ["unit_id"], name: "index_addons_on_unit_id"
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.string "latitude"
    t.string "longitude"
    t.string "receiver_name"
    t.string "receiver_mobile"
    t.string "land_mark"
    t.bigint "user_id"
    t.string "zip"
    t.string "status", default: "inactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "attribute_choices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "item_attribute_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_attribute_id"], name: "index_attribute_choices_on_item_attribute_id"
  end

  create_table "attribute_choices_item_variants", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "attribute_choice_id"
    t.bigint "item_variant_id"
    t.index ["attribute_choice_id"], name: "index_attribute_choices_item_variants_on_attribute_choice_id"
    t.index ["item_variant_id"], name: "index_attribute_choices_item_variants_on_item_variant_id"
  end

  create_table "batches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_variant_id"
    t.string "code"
    t.datetime "manufacturing_date"
    t.datetime "expiry_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_variant_id"], name: "index_batches_on_item_variant_id"
    t.index ["user_id"], name: "index_batches_on_user_id"
  end

  create_table "deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "subscription_id"
    t.text "remarks"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_deliveries_on_address_id"
    t.index ["subscription_id"], name: "index_deliveries_on_subscription_id"
  end

  create_table "item_attributes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_attributes_categories", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_attribute_id"
    t.bigint "item_category_id"
    t.index ["item_attribute_id"], name: "index_item_attributes_categories_on_item_attribute_id"
    t.index ["item_category_id"], name: "index_item_attributes_categories_on_item_category_id"
  end

  create_table "item_attributes_choices", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_attribute_id"
    t.bigint "item_choice_id"
    t.index ["item_attribute_id"], name: "index_item_attributes_choices_on_item_attribute_id"
    t.index ["item_choice_id"], name: "index_item_attributes_choices_on_item_choice_id"
  end

  create_table "item_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.decimal "price", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_variants_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "item_category_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
  end

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "batch_id"
    t.decimal "quantity", precision: 9, scale: 3
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_stocks_on_batch_id"
    t.index ["unit_id"], name: "index_stocks_on_unit_id"
  end

  create_table "subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "item_variant_id"
    t.decimal "quantity", precision: 10
    t.bigint "unit_id"
    t.integer "frequency"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "remarks"
    t.boolean "call_verified"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_subscriptions_on_address_id"
    t.index ["item_variant_id"], name: "index_subscriptions_on_item_variant_id"
    t.index ["unit_id"], name: "index_subscriptions_on_unit_id"
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "salutation"
    t.string "name"
    t.string "gender"
    t.string "username"
    t.string "email"
    t.string "mobile"
    t.string "type"
    t.boolean "premium"
    t.boolean "call_verified"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.decimal "price", precision: 7, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_vendor_items_on_item_id"
    t.index ["user_id"], name: "index_vendor_items_on_user_id"
  end

  add_foreign_key "deliveries", "addresses"
  add_foreign_key "deliveries", "subscriptions"
end
