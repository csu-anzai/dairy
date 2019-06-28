class CreateItemVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :item_variants do |t|
      t.references :item
      t.decimal :price, :precision => 7, :scale => 2

      t.timestamps
    end
  end
end
