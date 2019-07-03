class Locality < ApplicationRecord
	belongs_to :route, inverse_of: :locality
	has_many :addresses, through: :route
	has_one :vendor, through: :route
	has_one :delivery_executive, through: :route
	
	# Validations
    validates :name, presence: true, length: {mimimum: 5, maximum: 180}
    validates :description, allow_blank: true, length: {maximum: 1500, message: "must be less than 1500 characters!" }
end
