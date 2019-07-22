class User < ApplicationRecord

  has_secure_password
  STATUSES = %w[active inactive paused].freeze
  # Associations
  has_many :addresses, as: :addressable
  has_many :batches, inverse_of: :vendor, dependent: :destroy
  has_many :batches, inverse_of: :supplier, dependent: :destroy

  scope :customers, -> { where(type: 'Customer') }
  scope :vendors, -> { where(type: 'Vendor') }
  scope :delivery_executive, -> { where(type: 'DeliveryExecutive') }
  scope :suppliers, -> { where(type: 'Supplier') }

  # Validations
  validates :salutation, presence: true, length: {minimum: 2, maximum: 50}
  validates :name, presence: true, length: {minimum: 5, maximum: 150}
  validates :gender, presence: true, length: {minimum: 4, maximum: 25}
  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 150}
  validates :email, presence: true, uniqueness: true, length: {minimum: 7, maximum: 180}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :mobile, presence: true, numericality: true, length: {minimum: 10, maximum: 15}
  validates :date_of_birth, date: { before: Proc.new { Date.today -10.years}, message: "must be before #{(Date.today - 10.years).to_s}!", allow_blank: true }
  validates :type, presence: true, length: {minimum: 4, maximum: 50}

end