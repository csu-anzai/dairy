class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :address, foreign_key: true
      t.references :subscription, foreign_key: true
      t.string :status
      t.text :remarks

      t.timestamps
    end
  end
end
