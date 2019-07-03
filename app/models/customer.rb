class Customer < User
  # Associations
  has_many :subscriptions, through: :addresses
  has_many :addons, through: :subscriptions
  has_many :active_addons, through: :subscriptions
  has_many :item_variants, through: :subscriptions
  has_many :items, through: :item_variants
  has_many :deliveries, through: :subscriptions
  has_many :images, as: :imageable
end