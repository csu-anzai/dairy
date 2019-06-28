class Stock < ApplicationRecord
  belongs_to :batch, inverse_of: :stock
  belongs_to :unit, inverse_of: :stocks

  has_one :item_variant, through: :batch
  has_one :item, through: :item_variant
  has_one :item_category, through: :item_variant
  has_many :item_attributes, through: :item_variant
  has_many :attribute_choices, through: :item_variant
end
