class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :batch
      t.decimal :quantity, :precision => 9, :scale => 3
      t.references :unit

      t.timestamps
    end
  end
end
