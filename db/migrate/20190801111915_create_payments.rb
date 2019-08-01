class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :subscription
      t.decimal    :amount, :precision => 9, :scale => 2
      t.string     :mode, default: "cash"
      t.string     :paid_by
      t.text       :remarks
      t.bigint     :created_by
      t.bigint     :updated_by

      t.timestamps
    end
  end
end
