class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.references :store, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true

      t.timestamps
      t.index [:store_id, :shoe_id], unique: true, name: 'by_store'
    end
  end
end
