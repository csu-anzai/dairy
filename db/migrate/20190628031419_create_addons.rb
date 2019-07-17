class CreateAddons < ActiveRecord::Migration[5.2]
  def change
    create_table :addons do |t|
      t.references :subscription#, foreign_key: true
      t.references :unit
      t.string     :title
      t.decimal    :quantity, :precision => 9, :scale => 3
      t.datetime   :start_date
      t.datetime   :end_date
      t.text       :remarks
      t.string     :status, default: 'active'
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
