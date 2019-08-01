class ActualDelivery < ApplicationRecord
  STATUSES = %w[ pending processing dispatched delivered canceled ].freeze
  # Associations
  belongs_to :address, inverse_of: :actual_deliveries, dependent: :destroy
  belongs_to :subscription, inverse_of: :actual_deliveries, dependent: :destroy
  belongs_to :delivery_executive, inverse_of: :actual_deliveries, dependent: :destroy
  belongs_to :unit, inverse_of: :actual_deliveries, dependent: :destroy

  # Validations
  validates :remarks, allow_blank: true, length: {maximum: 1500}

  # csv generator
  def self.to_csv(array)
    columns = %i[Index Full_address Receiver_name Receiver_mobile Title Variant Quantity Unit Remarks Addon_details Payment Is_delivered]

    CSV.generate do |csv|
      csv << columns
      array.each do |subs|
        csv << subs.fetch_values(*columns)
      end
    end
  end

end
