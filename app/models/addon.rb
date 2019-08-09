class Addon < ApplicationRecord
  STATUSES = %w[active paused inactive].freeze
  # Associations
  belongs_to :subscription, inverse_of: :addons
  has_many :payments, through: :subscription
  belongs_to :unit, inverse_of: :addons

  delegate :price, to: :subscription

  #scope
  scope :active, -> { where('status = (?) and start_date <= (?) and end_date >= (?)', 'active', Date.current, Date.current) }
  scope :to_be_paid, -> { where( 'addons.start_date <= (?) ', Date.current) }
  
  # Validatins
  validates :quantity, presence: true, format: { with: /\A\d+(?:\.\d{0,3})?\z/ }, numericality: { greater_than_or_equal_to: 0.250, less_than_or_equal_to: 10000, message: "must be valid!" }
  validates :start_date, presence: true, date: { after: Proc.new { Date.today }, message: "must be from #{(Date.today + 1).to_s} onwords!" }
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date, message: "must be after the start date!"}
  validates :remarks, allow_blank: true, length: { maximum: 1500, message: "must be less than 1500 characters!" }

  def to_be_paid_amount
    (quantity * price * payable_days)
  end

  def payable_end_date
    end_date.to_date >= Date.current ? Date.current : end_date.to_date
  end

  def payable_days
    (payable_end_date - start_date.to_date).to_i + 1
  end

  def payed_amount
    payments ? payments.collect(&:amount).inject(&:+) : 0
  end

end
