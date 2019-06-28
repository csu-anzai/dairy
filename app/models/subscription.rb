class Subscription < ApplicationRecord
  belongs_to :address, inverse_of: :subscriptions
  has_many :addons, inverse_of: :subscription, dependent: :destroy
  has_one :addon, -> { where(status: 'active') }, inverse_of: :subscription, dependent: :destroy
  belongs_to :item_variant, inverse_of: :subscriptions, dependent: :destroy
  belongs_to :unit, inverse_of: :subscription, dependent: :destroy
  has_many :deliveries, inverse_of: :subscription, dependent: :destroy

  scope :active, -> { where(status: 'active') }
end
