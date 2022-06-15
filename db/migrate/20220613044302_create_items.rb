class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                    null: false
      t.text :profile,                   null: false
      t.integer :category_genre_id,      null: false
      t.integer :status_genre_id,        null: false
      t.integer :send_price_genre_id,    null: false
      t.integer :place_genre_id,         null: false
      t.integer :scheduled_day_genre_id, null: false
      t.integer :price,                  null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
