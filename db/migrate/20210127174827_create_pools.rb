class CreatePools < ActiveRecord::Migration[6.0]
  def change
    create_table :pools do |t|
      t.string :name
      t.string :address
      t.integer :rating
      t.text :description
      t.integer :price_hour

      t.timestamps
    end
  end
end
