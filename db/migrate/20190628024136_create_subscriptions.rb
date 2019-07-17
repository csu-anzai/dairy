class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :address#, foreign_key: true
      t.references :item_variant
      t.references :unit
      t.string     :title
      t.decimal    :quantity, :precision => 9, :scale => 3
      t.integer    :frequency
      t.datetime   :start_date
      t.datetime   :end_date
      t.text       :remarks
      t.boolean    :call_verified
      t.string     :status, default: 'inactive'
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
