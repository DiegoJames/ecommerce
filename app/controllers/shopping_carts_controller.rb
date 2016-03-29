class ShoppingCartsController < ApplicationController
  def show
    if @shopping_cart.payed?
      render "shopping_carts/complete"
    end
  end
end
