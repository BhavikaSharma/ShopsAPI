class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :cost
      t.belongs_to :Shop, foreign_key: true

      t.timestamps
    end
  end
end
