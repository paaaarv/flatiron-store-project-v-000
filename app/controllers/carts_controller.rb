require 'pry'
class CartsController < ApplicationController

  def show
    if current_user
      @user = current_user
      @current_cart = @user.current_cart
      @user.current_cart.save
    else
      redirect_to new_user_session_path
    end

  end

  def edit
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_item|
      @item = Item.find(line_item.item_id)
      @item.inventory -= line_item.quantity
      @item.save
    end
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
