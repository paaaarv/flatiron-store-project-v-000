class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  def current_cart=
    Cart.find_or_create_by(user_id: self.id)
  end

  def current_cart
    return current_cart
  end
end
