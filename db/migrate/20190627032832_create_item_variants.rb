class CreateItemVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :item_variants do |t|
      t.references :item
      t.decimal    :price, :precision => 9, :scale => 2
      t.boolean    :active, default: true
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
