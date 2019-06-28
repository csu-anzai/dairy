class Batch < ApplicationRecord
  belongs_to :vendor, class_name: 'User', foreign_key: 'user_id', inverse_of: :batches
  belongs_to :item_variant, inverse_of: :batches
  has_one :item, through: :item_variant
  has_one :stock, inverse_of: :batch, dependent: :destroy
end
