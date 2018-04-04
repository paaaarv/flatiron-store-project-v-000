require 'pry'

class LineItemsController < ApplicationController

  def create
<<<<<<< HEAD
    binding.pry
    @line_items = LineItem.find_or_create_by(item_id: params[:item_id])
    @line_items.cart_id = params[:cart_id]
    @line_items.save
    redirect_to cart_path(@line_items.cart_id)
=======
    @user = current_user
    if !@user.current_cart
      @user.current_cart = Cart.create(user_id: @user)
    end
    @user.current_cart.add_item(params[:item_id])
    redirect_to current_cart_path(@user.current_cart)
>>>>>>> f18282c34b2814b26b5efe254c6dcf4c0f60fe43
  end

end
