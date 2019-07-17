class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string   :salutation
      t.string   :name
      t.string   :gender
      t.string   :username
      t.string   :email
      t.string   :mobile
      t.date     :date_of_birth
      t.string   :password_digest
      t.string   :type
      t.boolean  :premier, default: false
      t.boolean  :call_verified, default: false
      t.boolean  :blacklisted, default: false
      t.boolean  :active, default: false
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.bigint   :created_by
      t.bigint   :updated_by

      t.timestamps
    end
  end
end
