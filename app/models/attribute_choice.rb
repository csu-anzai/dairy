class AttributeChoice < ApplicationRecord
  belongs_to :item_attribute, inverse_of: :attribute_choices
  has_and_belongs_to_many :item_variants
end
