class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, precision: 64, scale: 12, null: false

      t.timestamps null: false
    end
  end
end
