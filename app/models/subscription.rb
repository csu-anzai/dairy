require 'csv'
class Subscription < ApplicationRecord

  STATUSES = %w[active inactive].freeze
  FREQUENCIES = %W[everyday alternative_day weekly].freeze

  # Associations
  belongs_to :address, inverse_of: :subscriptions
  belongs_to :item_variant, inverse_of: :subscriptions, dependent: :destroy
  belongs_to :unit, inverse_of: :subscriptions, dependent: :destroy
  belongs_to :delivery_executive, inverse_of: :subscription, dependent: :destroy, optional: true

  has_one :customer, through: :address, source: :addressable, source_type: 'User'
  has_many :addons, inverse_of: :subscription, dependent: :destroy
  has_one :active_addon, -> { where(status: 'active') }, class_name: 'Addon', inverse_of: :subscription, dependent: :destroy
  has_many :actual_deliveries, inverse_of: :subscription, dependent: :destroy

  # scope
  scope :active, -> { where('status = (?) and start_date <= (?) and end_date >= (?)', 'active', Date.current, Date.current) }

  # Validations
  validates :quantity, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/ , message: "must be valid!"}, numericality: { greater_than_or_equal_to: 0.25, less_than_or_equal_to: 1000 }
  validates :frequency, presence: true, length: {minimum: 1, maximum: 3 }
  validates :start_date, presence: true, date: { after: Proc.new { Date.today }, message: "must be from #{(Date.today + 1).to_s} onwords!" }
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date, message: "must be after the start date!" }
  validates :remarks, allow_blank: true, length: {maximum: 1500, message: "must be less than 1500 characters!" }

  def self.to_csv(array)
    columns = %i[Index Full_address Receiver_name Receiver_mobile Title Variant Quantity Unit Frequency Period Remarks Is_delivered]

    CSV.generate do |csv|
      csv << columns
      array.each do |subs|
        csv << subs.fetch_values(*columns)
      end
    end
  end

end
