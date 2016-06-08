require 'pry'
require "./db/setup"
require "./lib/all"

i = Item.new
u = User.new
purch = Purchase.new
a = Address.new

#1) number of items
items = i.number_of_items
puts "There are #{items} items."


#2) most expensive item:
top_item = i.order_items_by_price
item = top_item.description
puts "The most expensive is #{item}"


#3) user who lives at 7153 Predovic Falls
id_by_address = a.find_user_by_address("7153 Predovic Falls")
user = u.find_user_by_id(id_by_address)
user_firstname = user.first_name
user_lastname = user.last_name
puts "#{user_firstname} #{user_lastname} lives there."


#4) number of Mediocre Copper Bottles sold:
item_id = i.get_item_id_by_description("Mediocre Copper Bottle")
number_of_things = purch.get_purchases_by_item_id item_id
puts "#{number_of_things} Mediocre Copper Bottle sold."


# ALTERNATE WAYS TO FIND NUMBER OF ITEM SOLD:
# total = 0
# i.purchases.each do |l|
#   total += l.quantity
# end
#
# OR
#
# i.purchases.pluck(:quantity).reduce(0, :+)
#
# OR
#
# i.purchases.sum(:quantity)

# OR

# purch.includes(:item).map{|purch| purch.quantity * purch.item.price}.reduce :+



#5) total revenue
prices_array = []
Purchase.all.each do |i|
  prices_array.push((i.item.price.to_f) * (i.quantity))
end
puts "Total revenue is #{(prices_array.reduce(:+)).round(2)}."



#6) how much Carmelo spent:
carmelo_array = []
user_id = u.find_id_by_user
#user_id => 101
# get array of their purchases:
purchases = purch.get_purchases_by_user_id(101)
purchases.each do |i|
  carmelo_array.push((i.item.price.to_f) * (i.quantity))
end
puts "Carmelo spent #{(carmelo_array.reduce(:+)).round(2)}."


# 7) how many users have > 1 address?
user_array = []
duplicates_array = []

Address.all.each do |i|
  user_array.push(i.user_id)
end

dup = user_array.select{|element| user_array.count(element) > 1 }
duplicates = duplicates_array.push(dup.uniq)
number_of_duplicates = duplicates.first.count
puts "#{number_of_duplicates} people have more than one address."
