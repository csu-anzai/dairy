class Batch < ApplicationRecord
  belongs_to :vendor, class_name: 'User', foreign_key: 'user_id', inverse_of: :batches
  belongs_to :item_variant, inverse_of: :batches
  has_one :stock, inverse_of: :batch, dependent: :destroy

  has_one :item, through: :item_variant
  has_one :item_category, through: :item_variant
  has_many :item_attributes, through: :item_variant
  has_many :attribute_choices, through: :item_variant
end
