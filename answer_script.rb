require 'pry'
require "./db/setup"
require "./lib/all"

i = Item.new
u = User.new
purch = Purchase.new
a = Address.new

#number of items
items = i.number_of_items
puts "There are #{items} items."


#most expensive item:
top_item = i.order_items_by_price
item = top_item.description
puts "The most expensive is #{item}"


#user who lives at 7153 Predovic Falls
id_by_address = a.find_user_by_address("7153 Predovic Falls")
user = u.find_user_by_id(id_by_address)
user_firstname = user.first_name
user_lastname = user.last_name
puts "#{user_firstname} #{user_lastname} lives there."


#number of Mediocre Copper Bottles sold:
item_id = i.get_item_id_by_description("Mediocre Copper Bottle")
number_of_things = purch.get_purchases_by_item_id item_id
puts "#{number_of_things}"


#total revenue
purch.each do |i|
  
