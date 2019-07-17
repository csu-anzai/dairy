class CreateItemAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_attributes do |t|
      t.string   :name
      t.boolean  :active, default: true
      t.bigint   :created_by
      t.bigint   :updated_by

      t.timestamps
    end
  end
end
