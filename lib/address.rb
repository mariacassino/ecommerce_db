class Address < ActiveRecord::Base
belongs_to :user


  def find_user_by_address address
    Address.where(street: address).pluck("user_id")
  end



end
