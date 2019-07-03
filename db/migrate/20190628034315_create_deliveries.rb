class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :address, foreign_key: true
      t.references :subscription, foreign_key: true
      t.text :remarks
      t.string :status, default: 'dending'

      t.timestamps
    end
  end
end
