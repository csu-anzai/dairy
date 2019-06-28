class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :address#, foreign_key: true
      t.references :item_variant#, foreign_key: true
      t.decimal :quantity
      t.references :unit
      t.integer :frequency
      t.string :status
      t.boolean :call_verified

      t.timestamps
    end
  end
end
