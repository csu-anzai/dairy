class AddJoinTables < ActiveRecord::Migration[5.2]
  def change
    create_table :item_attributes_categories, id: false do |t|
      t.belongs_to :item_attribute
      t.belongs_to :item_category
    end

    create_table :item_attributes_choices, id: false do |t|
      t.belongs_to :item_attribute
      t.belongs_to :item_choice
    end

    create_table :attribute_choices_item_variants, id: false do |t|
      t.belongs_to :attribute_choice
      t.belongs_to :item_variant
    end
  end
end
