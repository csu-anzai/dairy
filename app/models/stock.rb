class Stock < ApplicationRecord
  belongs_to :item
  belongs_to :batch
  belongs_to :unit
end
