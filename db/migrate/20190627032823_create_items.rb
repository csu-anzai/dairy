class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string 		:name
      t.references  :item_category#, foreign_key: true
      t.boolean 	:active, default: true
      t.bigint   	:created_by
      t.bigint   	:updated_by

      t.timestamps
    end
  end
end
