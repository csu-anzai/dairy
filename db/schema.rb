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

ActiveRecord::Schema.define(version: 2019_06_27_033508) do

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_variants_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "item_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_category_id"], name: "index_items_on_item_category_id"
  end

end
