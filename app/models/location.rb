class Location < ApplicationRecord
	STATUSES = %w[active inactive blacklisted].freeze
	
	has_many :addresses
	belongs_to :vendor, inverse_of: :locations
	belongs_to :delivery_executive, inverse_of: :locations
	
	# Validations
    validates :name, presence: true, length: {minimum: 4, maximum: 125}
  	validates :start_point, presence: true, length: {minimum: 7, maximum: 150}
  	validates :end_point, presence: true, length: {minimum: 7, maximum: 150}
    validates :description, allow_blank: true, length: {maximum: 1500, message: "must be less than 1500 characters!" }
end
