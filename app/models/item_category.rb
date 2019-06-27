class ItemCategory < ApplicationRecord
  has_and_belongs_to_many :item_attributes
  has_many :items, inverse_of: :item_category, dependent: :destroy
  has_many :item_variants, through: :items
  has_many :attribute_choices, through: :item_attributes
end
