class LineItemsController < ApplicationController

  def create
    @line_items = LineItem.find_or_create_by(item_id: params[:item_id])
    @line_items.cart_id = params[:cart_id]
    @line_items.save
    redirect_to '/'
  end
end
