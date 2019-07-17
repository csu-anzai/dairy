class CreateVendorItems < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_items do |t|
      t.references :item
      t.references :user
      t.decimal    :price, :precision => 9, :scale => 2
      t.boolean    :active, default: false
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
