class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :salutation
      t.string :name
      t.string :gender
      t.string :username
      t.string :email
      t.string :mobile
      t.date :date_of_birth
      t.string :type
      t.boolean :premium, default: false
      t.boolean :call_verified, default: false
      t.boolean :blacklisted, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
