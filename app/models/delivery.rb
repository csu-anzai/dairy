class Delivery < ApplicationRecord
  belongs_to :address, inverse_of: :deliveries, dependent: :destroy
  belongs_to :subscription, inverse_of: :deliveries, dependent: :destroy
end
