class DeliveryExecutive < User
  # Associations
  has_many :actual_deliveries, inverse_of: :delivery_executive, dependent: :destroy
  has_many :routes, inverse_of: :delivery_executive, dependent: :destroy
  has_many :locations, inverse_of: :delivery_executive, dependent: :destroy
  has_many :to_be_delivered_addresses, class_name: 'Address', through: :locations, source: :address
  has_many :delivered_addresses, class_name: 'Address', through: :actual_deliveries, source: :address
  has_many :images, as: :imageable
end