class CreateAttributeChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :attribute_choices do |t|
      t.references :item_attribute#, foreign_key: true
      t.string 	   :name
      t.boolean    :active, default: true
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
