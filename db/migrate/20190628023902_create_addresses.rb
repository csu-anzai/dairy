class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.integer :addressable_id
      t.string :addressable_type
      t.string :latitude
      t.string :longitude
      t.string :receiver_name
      t.string :receiver_mobile
      t.string :land_mark
      t.references :user#, foreign_key: true
      t.string :zip
      t.string :status, default: 'inactive'

      t.timestamps
    end
  end
end
