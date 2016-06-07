class Item < ActiveRecord::Base
  has_many :purchases

  def number_of_items
    Item.count
  end

  def order_items_by_price
    max = Item.maximum("price").to_f
    Item.where(price: max).first
  end

  def get_item_id_by_description description
    Item.where(description: description).pluck("id")
  end

end
