class Page < ApplicationRecord
	
	STATUSES = %w[active inactive blacklisted].freeze

	# Validations
  validates :headline, presence: true, uniqueness:  true, :length => { minimum: 4, maximum: 70}
  validates :title, presence: true, :length => { minimum: 25, maximum: 250}
	validates :description, allow_blank: true, length: {maximum: 1500, message: "must be less than 1500 characters!" }
	
end
