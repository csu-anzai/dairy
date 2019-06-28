class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :batch#, foreign_key: true
      t.decimal :quantity
      t.references :unit#, foreign_key: true

      t.timestamps
    end
  end
end
