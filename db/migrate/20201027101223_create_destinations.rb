class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :post_code,                null: false
      t.string :city,                     null: false
      t.string :address,                  null: false
      t.string :building
      t.string :telephone,                null: false
      t.references :buy,                  foreign_key: true
      t.integer :region_id,               null: false
      t.timestamps
    end
  end
end
