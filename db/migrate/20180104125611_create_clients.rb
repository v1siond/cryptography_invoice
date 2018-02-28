class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :direction, null: false
      t.string :phone, null: false
      t.string :identification, null: false

      t.timestamps null: false
    end
  end
end
