class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,            null: false
      t.text :explication,        null: false
      t.integer :price,           null: false
      t.references :user,         foreign_key: true
      t.integer :category_id,     null: false
      t.integer :item_status_id,  null: false
      t.integer :fee_shipping_id, null: false
      t.integer :region_id,       null: false
      t.integer :days_to_ship_id, null: false
      t.timestamps
    end
  end
end
