class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :nit, null: false, unique: true
      t.string :direction, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.integer    :deleted, default: 0
    end
    add_index :companies, :name, unique: true
    add_index :companies, :nit, unique: true
  end
end
