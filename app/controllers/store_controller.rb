require 'pry'
class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.available_items
    if user_signed_in?
      @user = current_user
    end
  end


end
