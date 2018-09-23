class Product < ApplicationRecord
  # Associations
  belongs_to :Shop
  has_many :line_items, dependent: :destroy

  # Validations
  validates_presence_of :name, :price
  validates_numericality_of :price, :greater_than_or_equal_to => 0.0

  after_save :update_line_items

  private
  def update_line_items
    line_items.each do |li|
      if price != li.price && li.name == name
        li.price = price
      elsif cost == li.price && li.name != name
        li.name = name
      end
      li.save
    end
  end

end
