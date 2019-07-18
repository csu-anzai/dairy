class Stock < ApplicationRecord
  # Associations
  belongs_to :batch, inverse_of: :stock
  belongs_to :unit, inverse_of: :stocks

  has_one :item_variant, through: :batch
  has_one :item, through: :item_variant
  has_one :item_category, through: :item_variant
  has_many :item_attributes, through: :item_variant
  has_many :attribute_choices, through: :item_variant

  # Validations
  validates :quantity, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/, message: "must be valid!" }, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100000 }
end
