class User < ApplicationRecord
  has_many :addresses, as: :addressable
  has_many :batches, inverse_of: :vendor, dependent: :destroy

  scope :customers, -> { where(type: 'Customer') }
  scope :vendors, -> { where(type: 'Vendor') }
end