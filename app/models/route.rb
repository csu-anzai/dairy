class Route < ApplicationRecord
  STATUSES = %w[active inactive blacklisted].freeze
  
  # Associations
  belongs_to :vendor, inverse_of: :routes
  belongs_to :delivery_executive, inverse_of: :routes
  has_many :localities, inverse_of: :route, dependent: :destroy
  has_many :addresses, through: :localities

  # Validations
  validates :name, presence: true, length: {minimum: 4, maximum: 125}
  validates :start_point, presence: true, length: {minimum: 7, maximum: 150}
  validates :end_point, presence: true, length: {minimum: 7, maximum: 150}
end
