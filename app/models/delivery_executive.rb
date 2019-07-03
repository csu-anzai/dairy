class DeliveryExecutive < User
  # Associations
  has_many :deliveries, inverse_of: :delivery_executive, dependent: :destroy
  has_many :routes, inverse_of: :delivery_executive, dependent: :destroy
  has_many :localities, through: :routes
  has_many :to_be_delivered_addresses, class_name: 'Address', through: :localities, source: :address
  has_many :delivered_addresses, class_name: 'Address', through: :deliveries, source: :address
  has_many :images, as: :imageable
end