class ItemVariant < ApplicationRecord
  belongs_to :item, inverse_of: :item_variants
  has_and_belongs_to_many :attribute_choices
  has_many :item_attributes, through: :attribute_choices
  has_one :item_category, through: :item
  has_many :subscriptions, inverse_of: :item_variant, dependent: :destroy
  has_many :batches, inverse_of: :item_variant, dependent: :destroy
  has_many :stocks, through: :batches
end
