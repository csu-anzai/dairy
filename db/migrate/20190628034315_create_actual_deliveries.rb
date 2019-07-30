class CreateActualDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :actual_deliveries do |t|
      t.references :address
      t.references :subscription
      t.references :delivery_executive
      t.decimal    :quantity, :precision => 9, :scale => 3, default: 0.0
      t.references :unit
      t.decimal    :amount, :precision => 9, :scale => 2, default: 0.0
      t.text       :remarks
      t.string     :status, default: 'delivered'
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
