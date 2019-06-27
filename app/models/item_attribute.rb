class ItemAttribute < ApplicationRecord
  has_and_belongs_to_many :item_categories
  has_many :attribute_choices, inverse_of: :item_attribute, dependent: :destroy
end
