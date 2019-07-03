class ItemVariant < ApplicationRecord
  # Associations
  belongs_to :item, inverse_of: :item_variants
  has_one :item_category, through: :item

  has_and_belongs_to_many :attribute_choices

  has_many :subscriptions, inverse_of: :item_variant, dependent: :destroy
  has_many :batches, inverse_of: :item_variant, dependent: :destroy

  has_many :item_attributes, through: :attribute_choices
  has_many :stocks, through: :batches

  has_many :in_stock_attribute_choices, through: :stocks, source: :attribute_choices
  has_many :in_stock_item_attributes, through: :stocks, source: :item_attributes

  # Validations
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "must be valid!" }, numericality: { greater_than: 0, less_than: 5000 }
end
