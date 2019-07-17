class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references 	:batch
      t.references 	:unit
      t.decimal 	:quantity, :precision => 9, :scale => 3
      t.boolean 	:active, default: true
      t.bigint   	:created_by
      t.bigint   	:updated_by

      t.timestamps
    end
  end
end
