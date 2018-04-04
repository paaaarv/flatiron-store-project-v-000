require 'pry'
class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.available_items
    if user_signed_in?
      @user = current_user
      @user.current_cart = Cart.find_by(user_id: @user.id, status: nil)
    end
  end


end
