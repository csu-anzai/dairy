class Vendor < User
  has_many :vendor_items, inverse_of: :vendor, dependent: :destroy
  has_many :items, through: :vendor_items
end