class Batch < ApplicationRecord
  belongs_to :vendor, class_name: 'User', foreign_key: 'user_id', inverse_of: :batches
  belongs_to :item, inverse_of: :batches
end
