require 'pry'
class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.available_items
    if user_signed_in?
      @user = current_user
      @current_cart = @user.current_cart
      @user.current_cart = Cart.find_or_create_by(user_id: @user.id)
      @user.current_cart.save
    end
  end


end
