class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :salutation
      t.string :name
      t.string :gender
      t.string :username
      t.string :email
      t.string :mobile
      t.string :type
      t.boolean :premium
      t.boolean :call_verified
      t.string :status

      t.timestamps
    end
  end
end
