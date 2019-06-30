class Subscription < ApplicationRecord
  STATUSES = %w[active inactive].freeze

  # Associations
  belongs_to :address, inverse_of: :subscriptions
  belongs_to :item_variant, inverse_of: :subscriptions, dependent: :destroy
  belongs_to :unit, inverse_of: :subscription, dependent: :destroy

  has_one :customer, through: :address, source: :addressable, source_type: 'User'
  has_many :addons, inverse_of: :subscription, dependent: :destroy
  has_one :active_addon, -> { where(status: 'active') }, class_name: 'Addon', inverse_of: :subscription, dependent: :destroy
  has_many :deliveries, inverse_of: :subscription, dependent: :destroy

  scope :active, -> { where(status: 'active') }

  # Validations
  validates :quantity, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/ , message: "must be valid!"}, numericality: { greater_than: 0, less_than: 1000 }
  validates :frequency, presence: true, length: {minimum: 1, maximum: 3 }
  # validates :start_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }
  # validates :end_date, presence: true, date: { after_or_equal_to:  :start_date, message: "must be after the start date!" }
  validates :remarks, allow_blank: true, length: {maximum: 1500, message: "must be less than 1500 characters!" }
end
