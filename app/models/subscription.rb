class Subscription < ApplicationRecord
  STATUSES = %w[active inactive].freeze

  belongs_to :address, inverse_of: :subscriptions
  belongs_to :item_variant, inverse_of: :subscriptions, dependent: :destroy
  belongs_to :unit, inverse_of: :subscription, dependent: :destroy

  has_one :customer, through: :address, source: :addressable, source_type: 'User'
  has_many :addons, inverse_of: :subscription, dependent: :destroy
  has_one :active_addon, -> { where(status: 'active') }, class_name: 'Addon', inverse_of: :subscription, dependent: :destroy
  has_many :deliveries, inverse_of: :subscription, dependent: :destroy

  scope :active, -> { where(status: 'active') }
end
