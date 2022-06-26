class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,   null: false
      t.integer :place_id,   null: false
      t.string :town,        null: false
      t.string :number,      null: false
      t.string :build_name,  null: false
      t.string :phone_number,null: false
      t.references :order,   null: false, foreign_key: true
      t.timestamps
    end
  end
end