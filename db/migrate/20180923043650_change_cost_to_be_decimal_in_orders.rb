class ChangeCostToBeDecimalInOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :cost, :decimal
  end
end
