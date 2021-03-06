class Shop < ApplicationRecord
  # Associations
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

  # Validations
  validates_presence_of :name
end
