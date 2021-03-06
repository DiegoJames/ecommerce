# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe ShoppingCart do
  describe "status" do 
    it "can be set as payed" do 
      shopping_cart = FactoryGirl.create(:shopping_cart)
      shopping_cart.payed!
      puts shopping_cart.status
      expect(shopping_cart.payed?).to be_truthy
    end
  end

  describe "#total" do 
    it "returns the total cost of the shopping cart" do 
    shopping_cart = FactoryGirl.create(:shopping_cart)
    products = FactoryGirl.create_list(:product,5)
    products.each do |product|
      FactoryGirl.create(:in_shopping_cart,product: product, shopping_cart: shopping_cart)
    end

    expect(shopping_cart.total).to eq(products.first.pricing * 5)
    end
  end

  it "should generate the links for each product" do 
    shopping_cart = FactoryGirl.create(:shopping_cart)
    products = FactoryGirl.create_list(:product,5)
    products.each do |product|
      FactoryGirl.create(:in_shopping_cart,product: product, shopping_cart: shopping_cart)
    end

    expect{shopping_cart.pay!}.to change(Link,:count).by(5)

  end

end
