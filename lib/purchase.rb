class Purchase < ActiveRecord::Base
belongs_to :user
belongs_to :item


  def get_purchases_by_item_id item_id
    Purchase.where(item_id: item_id).count
  end


  def get_purchases_by_user_id user_id
    Purchase.where(user_id: user_id).all
  end



end
