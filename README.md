# Shops API

This Rails API was created in accordance with Shopify's Winter 2018 Challenge. The project involves a Rails App with a SQLite3 db.

This app is available on http://35.238.181.211:3000/api/shops . It deployed to Google Kubernetes Engine.

## The API

4 models were created: Shops, Products, Orders and Line Items.

The routes.rb file was modified so that the line_items pertained to orders which, along with products, pertained to a store (i.e. nested routes were used). The following routes were defined:

![Routes](storage/routes.PNG?raw=true "Routes")

All CRUD actions are supported. This format was chosen because products will always be associated with a store. Thus, it made sense to physically connect them (through the url). A similar argument can be made for line items and orders and with orders and stores.

### Things to Note

* Every time a line item is saved, the order it corresponds to will update its total cost
* Every time a product is updated, the line numbers that correspond to that product are updated too

### Sample Queries

```
 curl -X GET http://35.238.181.211:3000/api/shops/
```
```
 curl -X GET http://35.238.181.211:3000/api/shops/1
```
```
 curl -X GET http://35.238.181.211:3000/api/shops/1/orders
```
```
 curl -X GET http://35.238.181.211:3000/api/shops/1/orders/1
```
```
 curl -X GET http://35.238.181.211:3000/api/shops/1/orders/1/line_items
```
```
 curl -X GET http://35.238.181.211:3000/api/shops/1/orders/1/line_items/1
```
```
 curl -X GET http://35.238.181.211:3000/api/shops/1/orders/1
```
```
 curl -X PATCH -H "Content-Type: application/json" -d '{"line_item": {"quantity" : "2"}}' http://35.238.181.211:3000/api/shops/1/orders/1/line_items/1
```
*From the last query, the total_cost of that line item, and the cost for the corresponding order should have changed

## The Database

A SQLite3 db was used. db/seeds.rb provides a some data to populate the database. If the code is run locally, use "rake db:seed". It is recommended that the Kubernetes instance is used instead though.

## Tests

minispec tests were created for the controllers. They can be run when the project is cloned locally, via the command "rails test".
