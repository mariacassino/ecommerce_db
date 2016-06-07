class User < ActiveRecord::Base
has_many :purchases


  def find_user_by_id id
    User.where(id: id).first 
  end



end
