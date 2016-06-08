class User < ActiveRecord::Base
has_many :purchases
has_many :addresses
has_many :items, through: :purchases 
validates_presence_of :first_name, :last_name

# attr_reader :username

def get_new_user
  puts "Enter first name:"
  first_name = gets.chomp
  puts "Enter last name:"
  last_name = gets.chomp
  User.create(first_name: first_name, last_name: last_name)
  puts "Hello #{first_name} #{last_name}"
end


  def find_user_by_id id
    User.where(id: id).first
  end

  def find_id_by_user
    User.where(first_name: "Carmelo").pluck("id")
  end





end
