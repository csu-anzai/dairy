class Unit < ApplicationRecord
  # Associations
  has_many :subscription, inverse_of: :unit, dependent: :destroy
  has_many :addons, inverse_of: :unit, dependent: :destroy
  has_many :stocks, inverse_of: :unit, dependent: :destroy

  # Validations
  validates :name, presence: true, length: {minimum: 4, maximum: 70}
  validates :code, presence: true, length: {minimum: 3, maximum: 40}
end
