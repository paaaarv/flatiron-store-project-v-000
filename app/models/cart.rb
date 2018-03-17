require 'pry'
class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

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

    @line_item = @item.line_items.find_or_create_by(cart_id: self.id)
  end
end
