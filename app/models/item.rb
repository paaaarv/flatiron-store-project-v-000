class Item < ActiveRecord::Base
  has_many :line_items
  has_many :carts, through: :items
  belongs_to :category

  def self.available_items
    array = []
    Item.all.each do |item|
      if item.inventory > 0
        array << item
      end
    end
    array
  end
end
