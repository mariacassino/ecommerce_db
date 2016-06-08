require 'pry'
require "./db/setup"
require "./lib/all"

u = User.new
i = Item.new

u.get_new_user
puts
puts "Here is our inventory:"
puts
i.display_items
puts
puts "Choose an item:"
item_choice = gets.chomp
