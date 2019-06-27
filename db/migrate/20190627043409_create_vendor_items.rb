class CreateVendorItems < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_items do |t|
      t.references :vendor, foreign_key: true
      t.references :item, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
