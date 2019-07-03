class Vendor < User
  # Associations
  has_many :vendor_items, inverse_of: :vendor, dependent: :destroy
  has_many :items, through: :vendor_items
  has_many :routes, inverse_of: :vendor, dependent: :destroy
  has_many :stocks, through: :batches
  has_many :in_stock_item_variants, through: :batches, source: :item_variant
  has_many :in_stock_items, through: :in_stock_item_variants, source: :item
  has_many :images, as: :imageable
end