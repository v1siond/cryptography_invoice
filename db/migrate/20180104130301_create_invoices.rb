class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :date, null: false
      t.float :balance, null: false
      t.float :tax, null: false
      t.integer :status, default: 0, null: false
      t.belongs_to :client, null: false
      t.belongs_to :company, null: false
      t.integer   :deleted, default: 0

      t.timestamps null: false
    end
  end
end
