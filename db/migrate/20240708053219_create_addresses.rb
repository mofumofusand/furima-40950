class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :area_id, null: false
      t.string :municipalities, null: false
      t.string :block, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :buy, null: false, foreign_key: true
      t.timestamps
    end
  end
end
