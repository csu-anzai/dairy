class ActualDelivery < ApplicationRecord
  STATUSES = %w[ pending processing delivered ].freeze
  # Associations
  belongs_to :address, inverse_of: :deliveries, dependent: :destroy
  belongs_to :subscription, inverse_of: :deliveries, dependent: :destroy
  belongs_to :delivery_executive, inverse_of: :deliveries, dependent: :destroy
  belongs_to :unit, inverse_of: :actual_deliveries, dependent: :destroy

  # Validations
  validates :remarks, allow_blank: true, length: {maximum: 1500}
end
