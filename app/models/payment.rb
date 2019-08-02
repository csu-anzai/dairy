class Payment < ApplicationRecord
  belongs_to :subscription, inverse_of: :payments

  # Validations
  validates :amount, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/ , message: "must be valid!"}, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999999999 }
  validates :mode, presence: true, length: {minimum: 3, maximum: 90 }
  validates :paid_by, allow_blank: true, length: { maximum: 150, message: "must be less than 150 characters!" }
  validates :remarks, allow_blank: true, length: { maximum: 1500, message: "must be less than 1500 characters!" }

end
