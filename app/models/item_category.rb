class ItemCategory < ApplicationRecord
  # Associations
  has_and_belongs_to_many :item_attributes
  has_many :items, inverse_of: :item_category, dependent: :destroy
  has_many :item_variants, through: :items
  has_many :attribute_choices, through: :item_attributes

  # Validations
  validates :name, presence: true, uniqueness:  true, :length => { minimum: 4, maximum: 70}
end
