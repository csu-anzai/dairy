class Stock < ApplicationRecord
  belongs_to :batch, inverse_of: :stock
  belongs_to :unit, inverse_of: :stocks
end
