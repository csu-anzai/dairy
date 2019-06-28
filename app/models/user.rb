class User < ApplicationRecord
  has_many :assresses, as: :addressable
end