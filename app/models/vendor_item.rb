class VendorItem < ApplicationRecord
  # Associations
  belongs_to :vendor, inverse_of: :vendor_item
  belongs_to :item, inverse_of: :vendor_item

  # Validations
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "must be valid!"  }, numericality: { greater_than: 0, less_than: 5000 }
end
