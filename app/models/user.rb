class User < ApplicationRecord

  has_secure_password
  STATUSES = %w[active inactive paused].freeze
  # Associations
  has_many :addresses, as: :addressable
  has_many :batches, inverse_of: :vendor, dependent: :destroy
  has_many :batches, inverse_of: :supplier, dependent: :destroy
  has_many :active_subscriptions, through: :addresses, source: :active_subscriptions

  has_many :to_be_paid_subscriptions,->{where('subscriptions.start_date <= (?) and subscriptions.end_date >= (?)', Date.current, Date.current)}, 
            through: :addresses, source: :subscriptions
  has_many :addons, through: :to_be_paid_subscriptions

  def to_be_paid_amount
    due_subs_amount + due_addon_amount
  end

  def due_subs_amount
    to_be_paid_subscriptions
      .includes(:addons, :item_variant, :payments)
        .collect do |x|
          [
            (
              (x.quantity * x.price * (((x.end_date.to_date >= Date.current ? Date.current : x.end_date.to_date) - x.start_date.to_date).to_i + 1)) - (x.payments ? x.payments.collect(&:amount).inject(&:+) : 0).to_i
            )   
          ]
        end
      .flatten.inject(&:+)
    .to_f
  end

  def due_addon_amount
    to_be_paid_subscriptions
      .collect do |x|
        [                    
          ( 
            x.addons.to_be_paid.collect do |y|
              (y.price * y.quantity) * (((y.end_date.to_date >= Date.current ? Date.current : y.end_date.to_date) - y.start_date.to_date).to_i + 1)
            end
          ) || 0                    
        ]
      end
      .flatten.inject(&:+)
    .to_f
  end


  scope :customers, -> { where(type: 'Customer') }
  scope :vendors, -> { where(type: 'Vendor') }
  scope :delivery_executive, -> { where(type: 'DeliveryExecutive') }
  scope :suppliers, -> { where(type: 'Supplier') }

  # Validations
  validates :salutation, presence: true, length: {minimum: 2, maximum: 50}
  validates :name, presence: true, length: {minimum: 3, maximum: 150}
  validates :gender, presence: true, length: {minimum: 4, maximum: 25}
  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 150}
  validates :email, presence: true, uniqueness: true, length: {minimum: 7, maximum: 180}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :mobile, presence: true, numericality: true, length: {minimum: 10, maximum: 15}
  validates :date_of_birth, date: { before: Proc.new { Date.today -10.years}, message: "must be before #{(Date.today - 10.years).to_s}!", allow_blank: true }
  validates :type, presence: true, length: {minimum: 4, maximum: 50}

end