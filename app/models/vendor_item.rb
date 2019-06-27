class VendorItem < ApplicationRecord
  belongs_to :vendor, inverse_of: :vendor_item
  belongs_to :item, inverse_of: :vendor_item
end
