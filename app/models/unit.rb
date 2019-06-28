class Unit < ApplicationRecord
  has_many :subscription, inverse_of: :unit, dependent: :destroy
  has_many :addons, inverse_of: :unit, dependent: :destroy
end
