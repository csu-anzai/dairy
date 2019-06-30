class Delivery < ApplicationRecord
  # Associations
  belongs_to :address, inverse_of: :deliveries, dependent: :destroy
  belongs_to :subscription, inverse_of: :deliveries, dependent: :destroy

  # Validations
  validates :remarks, allow_blank: true, length: {maximum: 1500}
end
