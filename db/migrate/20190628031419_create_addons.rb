class CreateAddons < ActiveRecord::Migration[5.2]
  def change
    create_table :addons do |t|
      t.references :subscription#, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :quantity
      t.references :unit#, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
