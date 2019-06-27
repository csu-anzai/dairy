class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :vendor
  belongs_to :unit
end
