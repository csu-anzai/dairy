class CreateItemVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :item_variants do |t|
      t.references :item
      t.decimal :price

      t.timestamps
    end
  end
end
