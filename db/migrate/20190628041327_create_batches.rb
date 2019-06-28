class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.references :user#, foreign_key: true
      t.references :item_variant#, foreign_key: true
      t.datetime :manufacturing_date#, foreign_key: true
      t.datetime :expiry_date#, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
