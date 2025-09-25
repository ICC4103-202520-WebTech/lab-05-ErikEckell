class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.integer :reservation_id
      t.integer :nights_subtotal
      t.integer :services_subtotal
      t.integer :tax
      t.integer :total
      t.datetime :issued_at
      t.string :status

      t.timestamps
    end
  end
end
