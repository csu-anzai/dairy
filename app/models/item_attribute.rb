class ItemAttribute < ApplicationRecord
  # Associations
  has_and_belongs_to_many :item_categories
  has_many :attribute_choices, inverse_of: :item_attribute, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness:  true, length: {minimum: 4, maximum: 70}
end
