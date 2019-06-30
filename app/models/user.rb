class User < ApplicationRecord
  # Associations
  has_many :addresses, as: :addressable
  has_many :batches, inverse_of: :vendor, dependent: :destroy

  scope :customers, -> { where(type: 'Customer') }
  scope :vendors, -> { where(type: 'Vendor') }

  # Validations
  validates :salutation, presence: true, length: {minimum: 2, maximum: 50}
  validates :name, presence: true, length: {minimum: 5, maximum: 150}
  validates :gender, presence: true, length: {minimum: 4, maximum: 25}
  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 150}
  validates :email, presence: true, uniqueness: true, length: {minimum: 7, maximum: 180}
  validates :mobile, presence: true, numericality: true, uniqueness: true, length: {minimum: 10, maximum: 15}
  validates :type, presence: true, length: {minimum: 4, maximum: 50}

end