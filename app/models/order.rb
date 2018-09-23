class Order < ApplicationRecord
  # Associations
  belongs_to :Shop
  has_many :line_items, dependent: :destroy

  # Validations

  validates_numericality_of :cost, :greater_than_or_equal_to => 0.0, :allow_blank => true
end
