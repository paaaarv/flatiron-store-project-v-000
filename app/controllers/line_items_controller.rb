require 'pry'

class LineItemsController < ApplicationController

  def create
    @user = current_user
    if @user.current_cart == nil
      @cart = Cart.create(user_id: @user.id)
      @user.current_cart= @cart
      @user.current_cart.save
    end
    @line_items = LineItem.find_or_create_by(item_id: params[:item_id], cart_id: @cart.id)
    @user.current_cart.add_item(params[:item_id])
    @user.current_cart.save
    redirect_to cart_path(@user.current_cart)
  end


end
