class Addon < ApplicationRecord
  STATUSES = %w[active inactive paused].freeze
  # Associations
  belongs_to :subscription, inverse_of: :addons
  belongs_to :unit, inverse_of: :addons

  # Validatins
  validates :quantity, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/ }, numericality: { greater_than_or_equal_to: 0.250, less_than_or_equal_to: 10000, message: "must be valid!" }
  validates :start_date, presence: true, date: { after: Proc.new { Date.today }, message: "must be from #{(Date.today + 1).to_s} onwords!" }
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date, message: "must be after the start date!"}
  validates :remarks, allow_blank: true, length: { maximum: 1500, message: "must be less than 1500 characters!" }

end
