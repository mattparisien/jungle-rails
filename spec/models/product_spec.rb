require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "tests validatation" do 
      @product = Product.new
      @category = Category.new
      @category.name = "Electronics"
      @product.name = "Red Bookshelf"
      @product.price_cents = 99555
      @product.quantity = 10
      @product.category = @category

      expect(@product.valid?).to be true
    end    
  end
end