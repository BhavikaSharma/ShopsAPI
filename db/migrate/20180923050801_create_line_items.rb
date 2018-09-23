class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.string :name
      t.belongs_to :Product, foreign_key: true
      t.belongs_to :Order, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.decimal :total_cost

      t.timestamps
    end
  end
end
