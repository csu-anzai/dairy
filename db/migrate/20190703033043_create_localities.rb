class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.references :route
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
