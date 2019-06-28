class Customer < User
  has_many :subscriptions, through: :addresses
end