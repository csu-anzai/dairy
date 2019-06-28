class Addon < ApplicationRecord
  belongs_to :subscription, inverse_of: :addons
  belongs_to :unit, inverse_of: :addons
end
