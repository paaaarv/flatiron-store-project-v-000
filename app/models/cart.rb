require 'pry'
class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user
  belongs_to :current_cart, class_name: "User", foreign_key: "user_id"

  def total
    array = []
    x = 0
    self.items.each do |item|
      x+=item.price
    end
    x
  end

  def add_item(item)
    @item = Item.find(item)
    @line_item = LineItem.find_by(item_id: @item.id, cart_id: self.id)
    if @line_item
      @line_item.quantity +=1
    else
      @line_item = LineItem.new(item_id: @item.id, cart_id: self.id)
    end
    @line_item
  end
end
