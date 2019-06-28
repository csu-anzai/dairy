class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  has_many :subscriptions, inverse_of: :address, dependent: :destroy
  has_many :deliveries, inverse_of: :address, dependent: :destroy
end
