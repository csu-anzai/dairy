class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.references :vendor
      t.references :delivery_executive
      t.string :name
      t.string :start_point
      t.string :end_point
      t.string :latitude
      t.string :longitude
      t.string :status, default: 'active'

      t.timestamps
    end
  end
end
