# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LineItem.destroy_all
Order.destroy_all
Product.destroy_all
Shop.destroy_all

Shop.create!([{
  id: 1,
  name: "Makeup Store",
  address: "123 Makeup Drive"
}])

Product.create!([{
  id: 1,
  name: "Eye Shadow",
  price: 20.00,
  Shop_id: 1
}])

Order.create!([{
  id: 1,
  cost: 20.00,
  Shop_id: 1
}])

LineItem.create!([{
  id: 1,
  name: "Eye Shadow",
  Order_id: 1,
  Product_id: 1,
  quantity: 1,
  price: 20.00,
  total_cost: 20.00
}])

p "Created #{Shop.count} shop"
