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

ActiveRecord::Schema.define(version: 2019_07_16_084911) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "actual_deliveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "subscription_id"
    t.bigint "delivery_executive_id"
    t.decimal "quantity", precision: 9, scale: 3, default: "0.0"
    t.bigint "unit_id"
    t.decimal "amount", precision: 9, scale: 2, default: "0.0"
    t.text "remarks"
    t.string "status", default: "delivered"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_actual_deliveries_on_address_id"
    t.index ["delivery_executive_id"], name: "index_actual_deliveries_on_delivery_executive_id"
    t.index ["subscription_id"], name: "index_actual_deliveries_on_subscription_id"
    t.index ["unit_id"], name: "index_actual_deliveries_on_unit_id"
  end

  create_table "addons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "subscription_id"
    t.bigint "unit_id"
    t.string "title"
    t.decimal "quantity", precision: 9, scale: 3
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "remarks"
    t.string "status", default: "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_addons_on_subscription_id"
    t.index ["unit_id"], name: "index_addons_on_unit_id"
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "location_id"
    t.string "addressable_type"
    t.string "address1"
    t.string "address2"
    t.integer "addressable_id"
    t.string "latitude"
    t.string "longitude"
    t.string "receiver_name"
    t.string "receiver_mobile"
    t.string "land_mark"
    t.string "zip"
    t.text "remarks"
    t.string "status", default: "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_addresses_on_location_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admin_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "attribute_choices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_attribute_id"
    t.string "name"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
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
    t.string "status", default: "active"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_variant_id"], name: "index_batches_on_item_variant_id"
    t.index ["user_id"], name: "index_batches_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_attributes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
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
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_variants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.string "title"
    t.decimal "price", precision: 9, scale: 2
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_variants_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "item_category_id"
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "vendor_id"
    t.bigint "delivery_executive_id"
    t.string "name"
    t.string "start_point"
    t.string "end_point"
    t.string "latitude"
    t.string "longitude"
    t.string "status", default: "active"
    t.text "description"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_executive_id"], name: "index_locations_on_delivery_executive_id"
    t.index ["vendor_id"], name: "index_locations_on_vendor_id"
  end

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "unit_id"
    t.decimal "quantity", precision: 9, scale: 3
    t.boolean "active", default: true
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_stocks_on_batch_id"
    t.index ["unit_id"], name: "index_stocks_on_unit_id"
  end

  create_table "subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "item_variant_id"
    t.bigint "unit_id"
    t.string "title"
    t.decimal "quantity", precision: 9, scale: 3
    t.integer "frequency"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "remarks"
    t.boolean "call_verified"
    t.string "status", default: "inactive"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_subscriptions_on_address_id"
    t.index ["item_variant_id"], name: "index_subscriptions_on_item_variant_id"
    t.index ["unit_id"], name: "index_subscriptions_on_unit_id"
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active", default: false
    t.bigint "created_by"
    t.bigint "updated_by"
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
    t.date "date_of_birth"
    t.string "password_digest"
    t.string "type"
    t.string "token"
    t.string "otp"
    t.datetime "otp_sent_at"
    t.boolean "premier", default: false
    t.boolean "call_verified", default: false
    t.boolean "blacklisted", default: false
    t.boolean "active", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "user_id"
    t.decimal "price", precision: 9, scale: 2
    t.boolean "active", default: false
    t.bigint "created_by"
    t.bigint "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_vendor_items_on_item_id"
    t.index ["user_id"], name: "index_vendor_items_on_user_id"
  end

end
