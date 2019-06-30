class Address < ApplicationRecord
  # Associations
  belongs_to :addressable, polymorphic: true
  has_many :subscriptions, inverse_of: :address, dependent: :destroy
  has_many :deliveries, inverse_of: :address, dependent: :destroy

  # Validations
  validates :address1, length: {minimum: 10, maximum: 180, message: "Must have 10 - 180 characters!"}, presence: true
  validates :address2, length: {maximum: 1500, message: "Must be less than 1500 characters!"}, allow_blank: true
  validates :receiver_name, length: {minimum: 4, maximum: 90, message: "Must have 4 - 90 characters!"}, presence: true
  validates :receiver_mobile, presence: true, numericality: true, length: {minimum: 10, maximum: 15, message: 'invalid!'}
  validates :zip, presence: true, length: {minimum: 4, maximum: 8}, format: { with: /\d{6}?$/, :multiline => true, message: "must be in the form of 123456!" }
end
