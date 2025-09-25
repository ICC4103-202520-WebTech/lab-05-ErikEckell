class ChangeQuantityInServiceUsages < ActiveRecord::Migration[8.0]
  def change
    rename_column :service_usages, :quantity_integer, :quantity
    change_column :service_usages, :quantity, :integer, using: 'quantity::integer'
  end
end
