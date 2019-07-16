class Address < ApplicationRecord
  STATUSES = %w[active inactive].freeze
  # Associations
  belongs_to :addressable, polymorphic: true
  belongs_to :location, inverse_of: :addresses, optional: true
  has_one :vendor, through: :location
  has_one :delivery_executive, through: :location
  has_many :subscriptions, inverse_of: :address, dependent: :destroy
  has_many :deliveries, inverse_of: :address, dependent: :destroy

  # Validations
  validates :address1, length: {minimum: 10, maximum: 180, message: "must have 10 - 180 characters!"}, presence: true
  validates :address2, length: {maximum: 1500, message: "must be less than 1500 characters!"}, allow_blank: true
  validates :receiver_name, allow_blank: true, length: {minimum: 4, maximum: 90, message: "must have 4 - 90 characters!"}
  validates :receiver_mobile, presence: true, numericality: true, length: {minimum: 10, maximum: 15, message: 'invalid!'}
  validates :zip, presence: true, length: {minimum: 4, maximum: 8}, format: { with: /\d{6}?$/, :multiline => true, message: "must be in the form of 123456!" }
end
