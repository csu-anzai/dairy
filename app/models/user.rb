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


  def payment_data
    data = []
    to_be_paid_subscriptions.includes(:addons, :item_variant, :payments).each do |subs|
      subs_detials = {}
      # data << { quantity: subs.quantity, price: subs.price, payable_days: subs.payable_days, amount: subs.to_be_paid_amount + subs.addons.to_be_paid.collect(&:to_be_paid_amount).inject(&:+) }

      subs_detials['subscriptions'] = { quantity: subs.quantity, price: subs.price, payable_days: subs.payable_days, amount: subs.to_be_paid_amount }
      data << subs_detials
      
      subs.addons.to_be_paid.each do |addon|
        addon_details = {}
        addon_details['addons'] = { quantity: addon.quantity, price: addon.price, payable_days: addon.payable_days, amount: addon.to_be_paid_amount }
        data << addon_details
      end

      data << { payments: {paid_amount: subs.payed_amount.to_i, total_payable: ( (subs_to_be_paid_amount + addons_to_be_paid_amount) -subs.payed_amount.to_i) } }

    end
    data
  end

  private

  def subs_to_be_paid_amount
    to_be_paid_subscriptions
      .includes(:addons, :item_variant, :payments)
      .collect(&:to_be_paid_amount)      
      .flatten
      .inject(&:+)
      .to_f
  end

  def addons_to_be_paid_amount
    to_be_paid_subscriptions
      .collect{|subs| subs.addons.to_be_paid.collect(&:to_be_paid_amount) }
      .flatten
      .inject(&:+)
      .to_f
  end
end