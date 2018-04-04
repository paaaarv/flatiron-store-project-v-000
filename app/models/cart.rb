require 'pry'
class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user


  def total
    x = 0
    self.line_items.each do |lineitem|
      @item = Item.find(lineitem.item_id)
      @price = @item.price * lineitem.quantity
      x+= @price
    end
    x
  end

  def add_item(item)
    @item = Item.find(item)
    @line_item = LineItem.find_by(item_id: @item.id, cart_id: self.id)
    if @line_item
      @line_item.quantity +=1
      @line_item.save
    else
      @line_item = LineItem.new(item_id: @item.id, cart_id: self.id)
    end
    if !self.items.include?(@item)
      self.items << @item
    end
    @line_item
  end
end
