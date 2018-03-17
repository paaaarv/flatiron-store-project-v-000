class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    if user_signed_in?
      @user = current_user
    end
  end

end
