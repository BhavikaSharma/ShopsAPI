class LineItem < ApplicationRecord
  # Associations
  belongs_to :Product
  belongs_to :Order

  # Validations
  validates_presence_of :price, :quantity
  validates_numericality_of :price, :greater_than_or_equal_to => 0.0
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0

  after_save :update_total_cost

  private

  def update_total_cost
    updated_cost = self.Order.line_items.sum(price * quantity)

    self.Order.cost = updated_cost
    self.Order.save

    self.update_columns(total_cost: updated_cost)
  end


end
