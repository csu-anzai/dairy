class CreateAttributeChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :attribute_choices do |t|
      t.string :name
      t.references :item_attribute#, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
