class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string  :headline
      t.string  :title
      t.text    :description
      t.string  :page_type
      t.boolean :active, default: true
      t.string  :created_by
      t.string  :updated_by

      t.timestamps
    end
  end
end
