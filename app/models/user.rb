class User < ApplicationRecord
  has_many :addresses, as: :addressable

  scope :customers, -> { where(type: 'Customer') }
  scope :vendors, -> { where(type: 'Vendor') }
end