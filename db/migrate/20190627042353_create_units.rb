class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string 	 :name
      t.string 	 :code
      t.boolean  :active, default: false
      t.bigint   :created_by
      t.bigint   :updated_by

      t.timestamps
    end
  end
end
