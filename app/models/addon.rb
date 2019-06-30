class Addon < ApplicationRecord
  # Associations
  belongs_to :subscription, inverse_of: :addons
  belongs_to :unit, inverse_of: :addons

  # Validatins
  validates :quantity, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/ }, numericality: { greater_than: 0, less_than: 10000, message: "must be valid!" }
  # validates :start_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "Must be at least #{(Date.today + 1).to_s}" }
  # validates :end_date, presence: true, date: { after_or_equal_to:  :start_date, message: "Must be after the start date!"}
  validates :remarks, allow_blank: true, length: { maximum: 1500, message: "Must be less than 1500 characters!" }

end
