class Payment < ApplicationRecord
  belongs_to :subscription, inverse_of: :payments
end
