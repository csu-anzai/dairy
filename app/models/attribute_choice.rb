class AttributeChoice < ApplicationRecord
  # Associations
  belongs_to :item_attribute, inverse_of: :attribute_choices
  has_and_belongs_to_many :item_variants

  # Validations
  validates :name, presence: true, length: {minimum: 4, maximum: 70}
end
