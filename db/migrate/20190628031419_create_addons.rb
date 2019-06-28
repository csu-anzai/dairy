class CreateAddons < ActiveRecord::Migration[5.2]
  def change
    create_table :addons do |t|
      t.references :subscription#, foreign_key: true
      t.decimal :quantity
      t.references :unit
      t.datetime :start_date
      t.datetime :end_date
      t.text :remarks
      t.string :status

      t.timestamps
    end
  end
end
