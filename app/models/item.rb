class Item < ApplicationRecord
  belongs_to :item_category, inverse_of: :items

  has_many :item_variants, inverse_of: :item, dependent: :destroy
  has_many :vendor_items, inverse_of: :item, dependent: :destroy

  has_many :item_attributes, through: :item_category
  has_many :stocks, through: :item_variants
  has_many :batches, through: :item_variants
  has_many :subscriptions, through: :item_variants
  has_many :active_subscriptions, -> { where('subscriptions.status = (?)', 'active') }, through: :item_variants, source: :subscriptions
  has_many :vendors, through: :vendor_items
end
