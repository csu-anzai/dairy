class CreateVendorItems < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_items do |t|
      t.references :item
      t.references :user
      t.decimal :price, :precision => 7, :scale => 2

      t.timestamps
    end
  end
end
