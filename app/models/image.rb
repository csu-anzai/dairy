class Image < ApplicationRecord

	belongs_to :imageable, polymorphic: true

	# Validations
	validates :name, presence: true, length: {minimum: 5, maximum: 150}
end
