require 'pry'

class LineItemsController < ApplicationController

  def create
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @user = current_user
    @user.current_cart = @cart
    @user.current_cart.add_item(params[:item_id])
    @user.save
    redirect_to cart_path(@user.current_cart)
  end

end
