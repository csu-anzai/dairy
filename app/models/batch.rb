class Batch < ApplicationRecord
  # Associations
  belongs_to :vendor, class_name: 'User', foreign_key: 'user_id', inverse_of: :batches
  belongs_to :item_variant, inverse_of: :batches
  has_one :stock, inverse_of: :batch, dependent: :destroy

  has_one :item, through: :item_variant
  has_one :item_category, through: :item_variant
  has_many :item_attributes, through: :item_variant
  has_many :attribute_choices, through: :item_variant

  # Validations
  validates :code, presence: true, length: { minimum: 4, maximum: 25}
  # validates :manufacturing_date, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "Must be at least #{(Date.today).to_s}" }
  # validates :expiry_date, presence: true, date: { after_or_equal_to:  :manufacturing_date, message: "Must be after the manufacturing date!" }
end
