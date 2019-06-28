class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.references :user#, foreign_key: true
      t.string :addressable_type
      t.integer :addressable_id

      t.timestamps
    end
  end
end
