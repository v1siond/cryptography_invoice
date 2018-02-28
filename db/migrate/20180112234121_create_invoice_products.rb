class CreateInvoiceProducts < ActiveRecord::Migration
  def change
    create_table :invoice_products do |t|
      t.belongs_to :invoice, null: false
      t.belongs_to :product, null: false
      t.integer :product_quantity, null: false
      t.float :product_total_price, null: false
    end
  end
end
