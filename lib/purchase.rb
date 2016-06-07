class Purchase < ActiveRecord::Base
belongs_to :user
belongs_to :item


  def get_purchases_by_item_id item_id
    Purchase.where(item_id: item_id).count
  end


  def get_revenue_by_item_id

  end






end

# quantities = []
# Purchase.quantity.each do |i|
#  quantities.push(quantity)
# end
