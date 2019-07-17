class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.references :user#, foreign_key: true
      t.references :item_variant
      t.string     :code
      t.datetime   :manufacturing_date
      t.datetime   :expiry_date
      t.string     :status, default: 'active'
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
